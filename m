Content-Type: multipart/mixed; boundary="===============2966724519447081099=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 20/22] btrfs: introduce btrfs_subpage for data inodes
Date: Wed, 06 Jan 2021 14:48:45 +0800
Message-ID: <6546bad5-b467-b246-4b5f-95d43b6658d9@intel.com>
In-Reply-To: <6dcda0b3-373f-71fd-d8eb-7a65ac9de4a6@gmx.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2966724519447081099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/6/21 1:32 PM, Qu Wenruo wrote:
>
>
> On 2021/1/6 =E4=B8=8B=E5=8D=881:04, kernel test robot wrote:
>> Hi Qu,
>>
>> Thank you for the patch! Perhaps something to improve:
>>
>> [auto build test WARNING on kdave/for-next]
>> [also build test WARNING on v5.11-rc2 next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: =

>> https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-add-read-only-s=
upport-for-subpage-sector-size/20210106-090847
>> base: https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git =

>> for-next
>> config: m68k-randconfig-s032-20210106 (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 9.3.0
>> reproduce:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget =

>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross =

>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cro=
ss
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install sparse
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # sparse version: v0.6.=
3-208-g46a52ca4-dirty
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

>> https://github.com/0day-ci/linux/commit/2c54bbf363f66a7c4d489fa0b7967ce5=
fc960afb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-re=
view https://github.com/0day-ci/linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags lin=
ux-review =

>> Qu-Wenruo/btrfs-add-read-only-support-for-subpage-sector-size/20210106-0=
90847
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 2c54bbf363=
f66a7c4d489fa0b7967ce5fc960afb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=
=3D$HOME/0day COMPILER=3Dgcc-9.3.0 =

>> make.cross C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dm6=
8k
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> "sparse warnings: (new ones prefixed by >>)"
>>>> fs/btrfs/inode.c:8352:13: sparse: sparse: incorrect type in =

>>>> assignment (different base types) @@=C2=A0=C2=A0=C2=A0=C2=A0 expected =
restricted =

>>>> vm_fault_t [assigned] [usertype] ret @@=C2=A0=C2=A0=C2=A0=C2=A0 got in=
t @@
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/inode.c:8352:13: sparse:=C2=A0=C2=A0=C2=A0=
=C2=A0 expected restricted =

>> vm_fault_t [assigned] [usertype] ret
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/inode.c:8352:13: sparse:=C2=A0=C2=A0=C2=A0=
=C2=A0 got int
>>>> fs/btrfs/inode.c:8353:13: sparse: sparse: restricted vm_fault_t =

>>>> degrades to integer
>
> Why I always forgot this...
>
> Now it get properly fixed in github. Although the submitted patch is
> still using @ret other than @ret2.
>
> Is there anyway to let LKP to run on specific branch so that I can avoid
> similar problems.

Hi Qu,

LKP can test private branches if you can provide the git tree url, =

please see
https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-ne=
w-kernel-tree-on-lkp

Best Regards,
Rong Chen

>
> Thanks,
> Qu
>> =C2=A0=C2=A0=C2=A0 fs/btrfs/inode.c: note: in included file (through =

>> include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
>> =C2=A0=C2=A0=C2=A0 include/linux/spinlock.h:394:9: sparse: sparse: conte=
xt imbalance =

>> in 'run_delayed_iput_locked' - unexpected unlock
>>
>> vim +8352 fs/btrfs/inode.c
>>
>> =C2=A0=C2=A0 8275
>> =C2=A0=C2=A0 8276=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0 8277=C2=A0=C2=A0=C2=A0=C2=A0 * btrfs_page_mkwrite() is not =
allowed to change the file =

>> size as it gets
>> =C2=A0=C2=A0 8278=C2=A0=C2=A0=C2=A0=C2=A0 * called from a page fault han=
dler when a page is first =

>> dirtied. Hence we must
>> =C2=A0=C2=A0 8279=C2=A0=C2=A0=C2=A0=C2=A0 * be careful to check for EOF =
conditions here. We set the =

>> page up correctly
>> =C2=A0=C2=A0 8280=C2=A0=C2=A0=C2=A0=C2=A0 * for a written page which mea=
ns we get ENOSPC checking =

>> when writing into
>> =C2=A0=C2=A0 8281=C2=A0=C2=A0=C2=A0=C2=A0 * holes and correct delalloc a=
nd unwritten extent mapping =

>> on filesystems that
>> =C2=A0=C2=A0 8282=C2=A0=C2=A0=C2=A0=C2=A0 * support these features.
>> =C2=A0=C2=A0 8283=C2=A0=C2=A0=C2=A0=C2=A0 *
>> =C2=A0=C2=A0 8284=C2=A0=C2=A0=C2=A0=C2=A0 * We are not allowed to take t=
he i_mutex here so we have =

>> to play games to
>> =C2=A0=C2=A0 8285=C2=A0=C2=A0=C2=A0=C2=A0 * protect against truncate rac=
es as the page could now be =

>> beyond EOF.=C2=A0 Because
>> =C2=A0=C2=A0 8286=C2=A0=C2=A0=C2=A0=C2=A0 * truncate_setsize() writes th=
e inode size before =

>> removing pages, once we have
>> =C2=A0=C2=A0 8287=C2=A0=C2=A0=C2=A0=C2=A0 * the page lock we can determi=
ne safely if the page is =

>> beyond EOF. If it is not
>> =C2=A0=C2=A0 8288=C2=A0=C2=A0=C2=A0=C2=A0 * beyond EOF, then the page is=
 guaranteed safe against =

>> truncation until we
>> =C2=A0=C2=A0 8289=C2=A0=C2=A0=C2=A0=C2=A0 * unlock the page.
>> =C2=A0=C2=A0 8290=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0 8291=C2=A0=C2=A0=C2=A0 vm_fault_t btrfs_page_mkwrite(struct=
 vm_fault *vmf)
>> =C2=A0=C2=A0 8292=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0 8293=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page =
*page =3D vmf->page;
>> =C2=A0=C2=A0 8294=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct inode=
 *inode =3D file_inode(vmf->vma->vm_file);
>> =C2=A0=C2=A0 8295=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct btrfs=
_fs_info *fs_info =3D btrfs_sb(inode->i_sb);
>> =C2=A0=C2=A0 8296=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct exten=
t_io_tree *io_tree =3D =

>> &BTRFS_I(inode)->io_tree;
>> =C2=A0=C2=A0 8297=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct btrfs=
_ordered_extent *ordered;
>> =C2=A0=C2=A0 8298=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct exten=
t_state *cached_state =3D NULL;
>> =C2=A0=C2=A0 8299=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct exten=
t_changeset *data_reserved =3D NULL;
>> =C2=A0=C2=A0 8300=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *kaddr;
>> =C2=A0=C2=A0 8301=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lon=
g zero_start;
>> =C2=A0=C2=A0 8302=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loff_t size;
>> =C2=A0=C2=A0 8303=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_fault_t r=
et;
>> =C2=A0=C2=A0 8304=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret2;
>> =C2=A0=C2=A0 8305=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int reserved=
 =3D 0;
>> =C2=A0=C2=A0 8306=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 reserved=
_space;
>> =C2=A0=C2=A0 8307=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 page_sta=
rt;
>> =C2=A0=C2=A0 8308=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 page_end;
>> =C2=A0=C2=A0 8309=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 end;
>> =C2=A0=C2=A0 8310
>> =C2=A0=C2=A0 8311=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reserved_spa=
ce =3D PAGE_SIZE;
>> =C2=A0=C2=A0 8312
>> =C2=A0=C2=A0 8313=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sb_start_pag=
efault(inode->i_sb);
>> =C2=A0=C2=A0 8314=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_start =
=3D page_offset(page);
>> =C2=A0=C2=A0 8315=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_end =3D=
 page_start + PAGE_SIZE - 1;
>> =C2=A0=C2=A0 8316=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end =3D page=
_end;
>> =C2=A0=C2=A0 8317
>> =C2=A0=C2=A0 8318=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0 8319=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Rese=
rving delalloc space after obtaining the page =

>> lock can lead to
>> =C2=A0=C2=A0 8320=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * dead=
lock. For example, if a dirty page is locked by =

>> this function
>> =C2=A0=C2=A0 8321=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and =
the call to btrfs_delalloc_reserve_space() ends =

>> up triggering
>> =C2=A0=C2=A0 8322=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * dirt=
y page write out, then the btrfs_writepage() =

>> function could
>> =C2=A0=C2=A0 8323=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * end =
up waiting indefinitely to get a lock on the =

>> page currently
>> =C2=A0=C2=A0 8324=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bein=
g processed by btrfs_page_mkwrite() function.
>> =C2=A0=C2=A0 8325=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0 8326=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret2 =3D btr=
fs_delalloc_reserve_space(BTRFS_I(inode), =

>> &data_reserved,
>> =C2=A0=C2=A0 8327=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_start, reserved_space);
>> =C2=A0=C2=A0 8328=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret2) {
>> =C2=A0=C2=A0 8329=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret2 =3D file_update_time(vmf->vma->vm_file);
>> =C2=A0=C2=A0 8330=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reserved =3D 1;
>> =C2=A0=C2=A0 8331=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8332=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret2) {
>> =C2=A0=C2=A0 8333=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D vmf_error(ret2);
>> =C2=A0=C2=A0 8334=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (reserved)
>> =C2=A0=C2=A0 8335=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0 8336=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto out_noreserve;
>> =C2=A0=C2=A0 8337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8338
>> =C2=A0=C2=A0 8339=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D VM_F=
AULT_NOPAGE; /* make the VM retry the fault */
>> =C2=A0=C2=A0 8340=C2=A0=C2=A0=C2=A0 again:
>> =C2=A0=C2=A0 8341=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock_page(pa=
ge);
>> =C2=A0=C2=A0 8342=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D i_s=
ize_read(inode);
>> =C2=A0=C2=A0 8343
>> =C2=A0=C2=A0 8344=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((page->m=
apping !=3D inode->i_mapping) ||
>> =C2=A0=C2=A0 8345=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (page_start >=3D size)) {
>> =C2=A0=C2=A0 8346=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* page got truncated out from underneath us */
>> =C2=A0=C2=A0 8347=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto out_unlock;
>> =C2=A0=C2=A0 8348=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8349=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait_on_page=
_writeback(page);
>> =C2=A0=C2=A0 8350
>> =C2=A0=C2=A0 8351=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock_extent_=
bits(io_tree, page_start, page_end, =

>> &cached_state);
>>> 8352=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D set_page_extent_=
mapped(page);
>>> 8353=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0 8354=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto out_unlock;
>> =C2=A0=C2=A0 8355
>> =C2=A0=C2=A0 8356=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0 8357=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * we c=
an't set the delalloc bits if there are pending =

>> ordered
>> =C2=A0=C2=A0 8358=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * exte=
nts.=C2=A0 Drop our locks and wait for them to finish
>> =C2=A0=C2=A0 8359=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0 8360=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ordered =3D =
btrfs_lookup_ordered_range(BTRFS_I(inode), =

>> page_start,
>> =C2=A0=C2=A0 8361=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE);
>> =C2=A0=C2=A0 8362=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ordered)=
 {
>> =C2=A0=C2=A0 8363=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unlock_extent_cached(io_tree, page_start, page_end,
>> =C2=A0=C2=A0 8364=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &cached_state);
>> =C2=A0=C2=A0 8365=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unlock_page(page);
>> =C2=A0=C2=A0 8366=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 btrfs_start_ordered_extent(ordered, 1);
>> =C2=A0=C2=A0 8367=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 btrfs_put_ordered_extent(ordered);
>> =C2=A0=C2=A0 8368=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto again;
>> =C2=A0=C2=A0 8369=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8370
>> =C2=A0=C2=A0 8371=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (page->in=
dex =3D=3D ((size - 1) >> PAGE_SHIFT)) {
>> =C2=A0=C2=A0 8372=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 reserved_space =3D round_up(size - page_start,
>> =C2=A0=C2=A0 8373=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fs_info->sectorsize);
>> =C2=A0=C2=A0 8374=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (reserved_space < PAGE_SIZE) {
>> =C2=A0=C2=A0 8375=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 end =3D page_start + reserved_space - =
1;
>> =C2=A0=C2=A0 8376 btrfs_delalloc_release_space(BTRFS_I(inode),
>> =C2=A0=C2=A0 8377=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 data_reserved, page_start,
>> =C2=A0=C2=A0 8378=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PAGE_SIZE - reserved_space, true);
>> =C2=A0=C2=A0 8379=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8380=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8381
>> =C2=A0=C2=A0 8382=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0 8383=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page=
_mkwrite gets called when the page is firstly =

>> dirtied after it's
>> =C2=A0=C2=A0 8384=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * faul=
ted in, but write(2) could also dirty a page =

>> and set delalloc
>> =C2=A0=C2=A0 8385=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bits=
, thus in this case for space account reason, =

>> we still need to
>> =C2=A0=C2=A0 8386=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * clea=
r any delalloc bits within this page range =

>> since we have to
>> =C2=A0=C2=A0 8387=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * rese=
rve data&meta space before lock_page() (see =

>> above comments).
>> =C2=A0=C2=A0 8388=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0 8389=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_extent=
_bit(&BTRFS_I(inode)->io_tree, page_start, =

>> end,
>> =C2=A0=C2=A0 8390=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXTENT_DELALLOC | EXTENT_D=
O_ACCOUNTING |
>> =C2=A0=C2=A0 8391=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EXTENT_DEFRAG, 0, 0, &cach=
ed_state);
>> =C2=A0=C2=A0 8392
>> =C2=A0=C2=A0 8393=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret2 =3D btr=
fs_set_extent_delalloc(BTRFS_I(inode), =

>> page_start, end, 0,
>> =C2=A0=C2=A0 8394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &cached_state);
>> =C2=A0=C2=A0 8395=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret2) {
>> =C2=A0=C2=A0 8396=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unlock_extent_cached(io_tree, page_start, page_end,
>> =C2=A0=C2=A0 8397=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &cached_state);
>> =C2=A0=C2=A0 8398=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D VM_FAULT_SIGBUS;
>> =C2=A0=C2=A0 8399=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 goto out_unlock;
>> =C2=A0=C2=A0 8400=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8401
>> =C2=A0=C2=A0 8402=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* page is w=
holly or partially inside EOF */
>> =C2=A0=C2=A0 8403=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (page_sta=
rt + PAGE_SIZE > size)
>> =C2=A0=C2=A0 8404=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 zero_start =3D offset_in_page(size);
>> =C2=A0=C2=A0 8405=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0 8406=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 zero_start =3D PAGE_SIZE;
>> =C2=A0=C2=A0 8407
>> =C2=A0=C2=A0 8408=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (zero_sta=
rt !=3D PAGE_SIZE) {
>> =C2=A0=C2=A0 8409=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 kaddr =3D kmap(page);
>> =C2=A0=C2=A0 8410=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 memset(kaddr + zero_start, 0, PAGE_SIZE - =

>> zero_start);
>> =C2=A0=C2=A0 8411=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 flush_dcache_page(page);
>> =C2=A0=C2=A0 8412=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 kunmap(page);
>> =C2=A0=C2=A0 8413=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8414=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ClearPageChe=
cked(page);
>> =C2=A0=C2=A0 8415=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_page_dir=
ty(page);
>> =C2=A0=C2=A0 8416=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SetPageUptod=
ate(page);
>> =C2=A0=C2=A0 8417
>> =C2=A0=C2=A0 8418=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BTRFS_I(inod=
e)->last_trans =3D fs_info->generation;
>> =C2=A0=C2=A0 8419=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BTRFS_I(inod=
e)->last_sub_trans =3D =

>> BTRFS_I(inode)->root->log_transid;
>> =C2=A0=C2=A0 8420=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BTRFS_I(inod=
e)->last_log_commit =3D =

>> BTRFS_I(inode)->root->last_log_commit;
>> =C2=A0=C2=A0 8421
>> =C2=A0=C2=A0 8422=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_exten=
t_cached(io_tree, page_start, page_end, =

>> &cached_state);
>> =C2=A0=C2=A0 8423
>> =C2=A0=C2=A0 8424=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 btrfs_delall=
oc_release_extents(BTRFS_I(inode), =

>> PAGE_SIZE);
>> =C2=A0=C2=A0 8425=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sb_end_pagef=
ault(inode->i_sb);
>> =C2=A0=C2=A0 8426=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extent_chang=
eset_free(data_reserved);
>> =C2=A0=C2=A0 8427=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return VM_FA=
ULT_LOCKED;
>> =C2=A0=C2=A0 8428
>> =C2=A0=C2=A0 8429=C2=A0=C2=A0=C2=A0 out_unlock:
>> =C2=A0=C2=A0 8430=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_page(=
page);
>> =C2=A0=C2=A0 8431=C2=A0=C2=A0=C2=A0 out:
>> =C2=A0=C2=A0 8432=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 btrfs_delall=
oc_release_extents(BTRFS_I(inode), =

>> PAGE_SIZE);
>> =C2=A0=C2=A0 8433=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 btrfs_delall=
oc_release_space(BTRFS_I(inode), =

>> data_reserved, page_start,
>> =C2=A0=C2=A0 8434=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reserved_space, (ret !=3D 0));
>> =C2=A0=C2=A0 8435=C2=A0=C2=A0=C2=A0 out_noreserve:
>> =C2=A0=C2=A0 8436=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sb_end_pagef=
ault(inode->i_sb);
>> =C2=A0=C2=A0 8437=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extent_chang=
eset_free(data_reserved);
>> =C2=A0=C2=A0 8438=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0 8439=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0 8440
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>

--===============2966724519447081099==--

