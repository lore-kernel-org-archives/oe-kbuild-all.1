Content-Type: multipart/mixed; boundary="===============7717805509474694639=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 2/2] mm: soft_dirty: userfaultfd: introduce wrprotect_tlb_flush_pending
Date: Fri, 08 Jan 2021 05:36:42 +0800
Message-ID: <202101080522.92zFZv3G-lkp@intel.com>
In-Reply-To: <20210107200402.31095-3-aarcange@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7717805509474694639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master hnaz-linux-mm/master v5.11-rc2 nex=
t-20210104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andrea-Arcangeli/page_coun=
t-can-t-be-used-to-decide-when-wp_page_copy/20210108-040616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
09162bc32c880a791c6c0668ce0745cf7958f576
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> fs/proc/task_mmu.c:1248:33: warning: Uninitialized variable: tmp [uninit=
var]
       for (vma =3D mm->mmap; vma !=3D tmp;
                                   ^

vim +1248 fs/proc/task_mmu.c

  1183	=

  1184	static ssize_t clear_refs_write(struct file *file, const char __user=
 *buf,
  1185					size_t count, loff_t *ppos)
  1186	{
  1187		struct task_struct *task;
  1188		char buffer[PROC_NUMBUF];
  1189		struct mm_struct *mm;
  1190		struct vm_area_struct *vma;
  1191		enum clear_refs_types type;
  1192		int itype;
  1193		int rv;
  1194	=

  1195		memset(buffer, 0, sizeof(buffer));
  1196		if (count > sizeof(buffer) - 1)
  1197			count =3D sizeof(buffer) - 1;
  1198		if (copy_from_user(buffer, buf, count))
  1199			return -EFAULT;
  1200		rv =3D kstrtoint(strstrip(buffer), 10, &itype);
  1201		if (rv < 0)
  1202			return rv;
  1203		type =3D (enum clear_refs_types)itype;
  1204		if (type < CLEAR_REFS_ALL || type >=3D CLEAR_REFS_LAST)
  1205			return -EINVAL;
  1206	=

  1207		task =3D get_proc_task(file_inode(file));
  1208		if (!task)
  1209			return -ESRCH;
  1210		mm =3D get_task_mm(task);
  1211		if (mm) {
  1212			struct mmu_notifier_range range;
  1213			struct clear_refs_private cp =3D {
  1214				.type =3D type,
  1215			};
  1216	=

  1217			if (type =3D=3D CLEAR_REFS_MM_HIWATER_RSS) {
  1218				if (mmap_write_lock_killable(mm)) {
  1219					count =3D -EINTR;
  1220					goto out_mm;
  1221				}
  1222	=

  1223				/*
  1224				 * Writing 5 to /proc/pid/clear_refs resets the peak
  1225				 * resident set size to this mm's current rss value.
  1226				 */
  1227				reset_mm_hiwater_rss(mm);
  1228				mmap_write_unlock(mm);
  1229				goto out_mm;
  1230			}
  1231	=

  1232			if (mmap_read_lock_killable(mm)) {
  1233				count =3D -EINTR;
  1234				goto out_mm;
  1235			}
  1236			if (type =3D=3D CLEAR_REFS_SOFT_DIRTY) {
  1237				for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
  1238					struct vm_area_struct *tmp;
  1239					if (!(vma->vm_flags & VM_SOFTDIRTY)) {
  1240						inc_wrprotect_tlb_flush_pending(vma);
  1241						continue;
  1242					}
  1243	=

  1244					/*
  1245					 * Rollback wrprotect_tlb_flush_pending before
  1246					 * releasing the mmap_lock.
  1247					 */
> 1248					for (vma =3D mm->mmap; vma !=3D tmp;
  1249					     vma =3D vma->vm_next)
  1250						dec_wrprotect_tlb_flush_pending(vma);
  1251	=

  1252					mmap_read_unlock(mm);
  1253					if (mmap_write_lock_killable(mm)) {
  1254						count =3D -EINTR;
  1255						goto out_mm;
  1256					}
  1257					for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
  1258						vma->vm_flags &=3D ~VM_SOFTDIRTY;
  1259						vma_set_page_prot(vma);
  1260						inc_wrprotect_tlb_flush_pending(vma);
  1261					}
  1262					mmap_write_downgrade(mm);
  1263					break;
  1264				}
  1265	=

  1266				inc_tlb_flush_pending(mm);
  1267				mmu_notifier_range_init(&range, MMU_NOTIFY_SOFT_DIRTY,
  1268							0, NULL, mm, 0, -1UL);
  1269				mmu_notifier_invalidate_range_start(&range);
  1270			}
  1271			walk_page_range(mm, 0, mm->highest_vm_end, &clear_refs_walk_ops,
  1272					&cp);
  1273			if (type =3D=3D CLEAR_REFS_SOFT_DIRTY) {
  1274				mmu_notifier_invalidate_range_end(&range);
  1275				flush_tlb_mm(mm);
  1276				for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
  1277					dec_wrprotect_tlb_flush_pending(vma);
  1278				dec_tlb_flush_pending(mm);
  1279			}
  1280			mmap_read_unlock(mm);
  1281	out_mm:
  1282			mmput(mm);
  1283		}
  1284		put_task_struct(task);
  1285	=

  1286		return count;
  1287	}
  1288	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7717805509474694639==--

