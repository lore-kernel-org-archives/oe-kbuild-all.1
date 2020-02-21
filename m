Content-Type: multipart/mixed; boundary="===============0648295271735999296=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:core/rcu 3/14] arch/x86/kernel/cpu/mce/core.c:1257:2: error: implicit declaration of function 'nmi_enter'; did you mean 'irq_enter'?
Date: Fri, 21 Feb 2020 12:12:49 +0800
Message-ID: <202002211209.SHVUzF5k%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0648295271735999296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git co=
re/rcu
head:   57568d29563b0c8ea8a60458c049a6800b4987b7
commit: 1b0f7ed31b668c0df499b81775cf6d5f966327ba [3/14] x86: Replace ist_en=
ter() with nmi_enter()
config: x86_64-alldefconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
reproduce:
        git checkout 1b0f7ed31b668c0df499b81775cf6d5f966327ba
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/core.c: In function 'do_machine_check':
>> arch/x86/kernel/cpu/mce/core.c:1257:2: error: implicit declaration of fu=
nction 'nmi_enter'; did you mean 'irq_enter'? [-Werror=3Dimplicit-function-=
declaration]
     nmi_enter();
     ^~~~~~~~~
     irq_enter
   arch/x86/kernel/cpu/mce/core.c:1353:24: error: invalid type argument of =
'->' (have 'struct mce')
      current->mce_addr =3D m->addr;
                           ^~
   arch/x86/kernel/cpu/mce/core.c:1354:26: error: invalid type argument of =
'->' (have 'struct mce')
      current->mce_status =3D m->mcgstatus;
                             ^~
   arch/x86/kernel/cpu/mce/core.c:1359:3: error: implicit declaration of fu=
nction 'task_work_add'; did you mean 'task_lock'? [-Werror=3Dimplicit-funct=
ion-declaration]
      task_work_add(current, &current->mce_kill_me, true);
      ^~~~~~~~~~~~~
      task_lock
>> arch/x86/kernel/cpu/mce/core.c:1366:2: error: implicit declaration of fu=
nction 'nmi_exit'; did you mean 'irq_exit'? [-Werror=3Dimplicit-function-de=
claration]
     nmi_exit();
     ^~~~~~~~
     irq_exit
   cc1: some warnings being treated as errors

vim +1257 arch/x86/kernel/cpu/mce/core.c

  1210	=

  1211	/*
  1212	 * The actual machine check handler. This only handles real
  1213	 * exceptions when something got corrupted coming in through int 18.
  1214	 *
  1215	 * This is executed in NMI context not subject to normal locking rul=
es. This
  1216	 * implies that most kernel services cannot be safely used. Don't ev=
en
  1217	 * think about putting a printk in there!
  1218	 *
  1219	 * On Intel systems this is entered on all CPUs in parallel through
  1220	 * MCE broadcast. However some CPUs might be broken beyond repair,
  1221	 * so be always careful when synchronizing with others.
  1222	 */
  1223	notrace void do_machine_check(struct pt_regs *regs, long error_code)
  1224	{
  1225		DECLARE_BITMAP(valid_banks, MAX_NR_BANKS);
  1226		DECLARE_BITMAP(toclear, MAX_NR_BANKS);
  1227		struct mca_config *cfg =3D &mca_cfg;
  1228		int cpu =3D smp_processor_id();
  1229		struct mce m, *final;
  1230		char *msg =3D NULL;
  1231		int worst =3D 0;
  1232	=

  1233		/*
  1234		 * Establish sequential order between the CPUs entering the machine
  1235		 * check handler.
  1236		 */
  1237		int order =3D -1;
  1238	=

  1239		/*
  1240		 * If no_way_out gets set, there is no safe way to recover from this
  1241		 * MCE.  If mca_cfg.tolerant is cranked up, we'll try anyway.
  1242		 */
  1243		int no_way_out =3D 0;
  1244	=

  1245		/*
  1246		 * If kill_it gets set, there might be a way to recover from this
  1247		 * error.
  1248		 */
  1249		int kill_it =3D 0;
  1250	=

  1251		/*
  1252		 * MCEs are always local on AMD. Same is determined by MCG_STATUS_L=
MCES
  1253		 * on Intel.
  1254		 */
  1255		int lmce =3D 1;
  1256	=

> 1257		nmi_enter();
  1258	=

  1259		if (__mc_check_crashing_cpu(cpu))
  1260			goto out;
  1261	=

  1262		this_cpu_inc(mce_exception_count);
  1263	=

  1264		mce_gather_info(&m, regs);
  1265		m.tsc =3D rdtsc();
  1266	=

  1267		final =3D this_cpu_ptr(&mces_seen);
  1268		*final =3D m;
  1269	=

  1270		memset(valid_banks, 0, sizeof(valid_banks));
  1271		no_way_out =3D mce_no_way_out(&m, &msg, valid_banks, regs);
  1272	=

  1273		barrier();
  1274	=

  1275		/*
  1276		 * When no restart IP might need to kill or panic.
  1277		 * Assume the worst for now, but if we find the
  1278		 * severity is MCE_AR_SEVERITY we have other options.
  1279		 */
  1280		if (!(m.mcgstatus & MCG_STATUS_RIPV))
  1281			kill_it =3D 1;
  1282	=

  1283		/*
  1284		 * Check if this MCE is signaled to only this logical processor,
  1285		 * on Intel, Zhaoxin only.
  1286		 */
  1287		if (m.cpuvendor =3D=3D X86_VENDOR_INTEL ||
  1288		    m.cpuvendor =3D=3D X86_VENDOR_ZHAOXIN)
  1289			lmce =3D m.mcgstatus & MCG_STATUS_LMCES;
  1290	=

  1291		/*
  1292		 * Local machine check may already know that we have to panic.
  1293		 * Broadcast machine check begins rendezvous in mce_start()
  1294		 * Go through all banks in exclusion of the other CPUs. This way we
  1295		 * don't report duplicated events on shared banks because the first=
 one
  1296		 * to see it will clear it.
  1297		 */
  1298		if (lmce) {
  1299			if (no_way_out)
  1300				mce_panic("Fatal local machine check", &m, msg);
  1301		} else {
  1302			order =3D mce_start(&no_way_out);
  1303		}
  1304	=

  1305		__mc_scan_banks(&m, final, toclear, valid_banks, no_way_out, &worst=
);
  1306	=

  1307		if (!no_way_out)
  1308			mce_clear_state(toclear);
  1309	=

  1310		/*
  1311		 * Do most of the synchronization with other CPUs.
  1312		 * When there's any problem use only local no_way_out state.
  1313		 */
  1314		if (!lmce) {
  1315			if (mce_end(order) < 0)
  1316				no_way_out =3D worst >=3D MCE_PANIC_SEVERITY;
  1317		} else {
  1318			/*
  1319			 * If there was a fatal machine check we should have
  1320			 * already called mce_panic earlier in this function.
  1321			 * Since we re-read the banks, we might have found
  1322			 * something new. Check again to see if we found a
  1323			 * fatal error. We call "mce_severity()" again to
  1324			 * make sure we have the right "msg".
  1325			 */
  1326			if (worst >=3D MCE_PANIC_SEVERITY && mca_cfg.tolerant < 3) {
  1327				mce_severity(&m, cfg->tolerant, &msg, true);
  1328				mce_panic("Local fatal machine check!", &m, msg);
  1329			}
  1330		}
  1331	=

  1332		/*
  1333		 * If tolerant is at an insane level we drop requests to kill
  1334		 * processes and continue even when there is no way out.
  1335		 */
  1336		if (cfg->tolerant =3D=3D 3)
  1337			kill_it =3D 0;
  1338		else if (no_way_out)
  1339			mce_panic("Fatal machine check on current CPU", &m, msg);
  1340	=

  1341		if (worst > 0)
  1342			irq_work_queue(&mce_irq_work);
  1343	=

  1344		mce_wrmsrl(MSR_IA32_MCG_STATUS, 0);
  1345	=

  1346		sync_core();
  1347	=

  1348		if (worst !=3D MCE_AR_SEVERITY && !kill_it)
  1349			goto out;
  1350	=

  1351		/* Fault was in user mode and we need to take some action */
  1352		if ((m.cs & 3) =3D=3D 3) {
  1353			current->mce_addr =3D m->addr;
  1354			current->mce_status =3D m->mcgstatus;
  1355			current->mce_kill_me.func =3D mce_kill_me_maybe;
  1356			if (kill_it)
  1357				current->mce_kill_me.func =3D mce_kill_me_now;
  1358	=

  1359			task_work_add(current, &current->mce_kill_me, true);
  1360		} else {
  1361			if (!fixup_exception(regs, X86_TRAP_MC, error_code, 0))
  1362				mce_panic("Failed kernel mode recovery", &m, msg);
  1363		}
  1364	=

  1365	out:
> 1366		nmi_exit();
  1367	}
  1368	EXPORT_SYMBOL_GPL(do_machine_check);
  1369	NOKPROBE_SYMBOL(do_machine_check);
  1370	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0648295271735999296==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wKAAAA==
--===============0648295271735999296==--

