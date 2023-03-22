Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B115A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 01:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679448852; x=1710984852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6hmjfKoqknyw4S7e5Gcw7xDoNyxM2+AV2L8Lxshp0OY=;
  b=GJLzfe+VDmX12WHHV91yXPookpVxaRatfT2Q6Jhgz9x88/pheXvxeytN
   1aLsukaS4iPE6V/TNp8FnbrwLEYiGCPSew1fT75W3tc1dxsMURg2BbBBS
   sPUT8zNHYnl6AtZnAfB0F7fYc9fnqkQexNX8gb4ebTPtY8O/Jhyl4NkJd
   DPSXGlXMelwS77K2grzqj0bBIE5YJ4J+mPJg3gJvADkQgFBgzr9URIW1o
   +k5omSAgr8UgveASs0HOhU18/ArBKI+iAW8b4TZREZcPhr/4pS2JgkQyl
   ARl+odMwbOOfyqeiw1GZcrgpTFRZ8N/Mi9eivTZWYxiGOePjQyFXBm4SY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403987752"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="403987752"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 18:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="714229401"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="714229401"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Mar 2023 18:34:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1penMc-000Cek-19;
	Wed, 22 Mar 2023 01:34:06 +0000
Date: Wed, 22 Mar 2023 09:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 8971/9999] kernel/sysctl.c:1380:36: error:
 'cgroup_supply_delay_time' undeclared here (not in a function)
Message-ID: <202303220925.BKjR5mtd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: eb28d2c288c25346599f1746e8bbed46f2ae061b [8971/9999] anolis: cgroup: add user space interface for cgroup pool
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20230322/202303220925.BKjR5mtd-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alibaba/cloud-kernel/commit/eb28d2c288c25346599f1746e8bbed46f2ae061b
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout eb28d2c288c25346599f1746e8bbed46f2ae061b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220925.BKjR5mtd-lkp@intel.com/

Note: the alibaba-cloud/linux-next HEAD d121e0c25d1a19485d7f293b67901462bb1a6552 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/dma-mapping.h:14,
                    from include/linux/skbuff.h:34,
                    from include/net/net_namespace.h:36,
                    from include/linux/inet.h:46,
                    from include/linux/sunrpc/msg_prot.h:204,
                    from include/linux/sunrpc/auth.h:16,
                    from include/linux/nfs_fs.h:31,
                    from kernel/sysctl.c:53:
   include/linux/swiotlb.h:128:1: error: expected identifier or '(' before '{' token
     128 | {
         | ^
>> kernel/sysctl.c:1380:36: error: 'cgroup_supply_delay_time' undeclared here (not in a function)
    1380 |                 .data           = &cgroup_supply_delay_time,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/swiotlb.h:127:22: warning: 'swiotlb_max_mapping_size' declared 'static' but never defined [-Wunused-function]
     127 | static inline size_t swiotlb_max_mapping_size(struct device *dev);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:121:22: warning: 'penalty_extra_delay_max' defined but not used [-Wunused-variable]
     121 | static unsigned long penalty_extra_delay_max = HZ;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/cgroup_supply_delay_time +1380 kernel/sysctl.c

  1063	
  1064	#if defined(CONFIG_X86_LOCAL_APIC) && defined(CONFIG_X86)
  1065		{
  1066			.procname       = "unknown_nmi_panic",
  1067			.data           = &unknown_nmi_panic,
  1068			.maxlen         = sizeof (int),
  1069			.mode           = 0644,
  1070			.proc_handler   = proc_dointvec,
  1071		},
  1072	#endif
  1073	#if defined(CONFIG_X86)
  1074		{
  1075			.procname	= "panic_on_unrecovered_nmi",
  1076			.data		= &panic_on_unrecovered_nmi,
  1077			.maxlen		= sizeof(int),
  1078			.mode		= 0644,
  1079			.proc_handler	= proc_dointvec,
  1080		},
  1081		{
  1082			.procname	= "panic_on_io_nmi",
  1083			.data		= &panic_on_io_nmi,
  1084			.maxlen		= sizeof(int),
  1085			.mode		= 0644,
  1086			.proc_handler	= proc_dointvec,
  1087		},
  1088	#ifdef CONFIG_DEBUG_STACKOVERFLOW
  1089		{
  1090			.procname	= "panic_on_stackoverflow",
  1091			.data		= &sysctl_panic_on_stackoverflow,
  1092			.maxlen		= sizeof(int),
  1093			.mode		= 0644,
  1094			.proc_handler	= proc_dointvec,
  1095		},
  1096	#endif
  1097		{
  1098			.procname	= "bootloader_type",
  1099			.data		= &bootloader_type,
  1100			.maxlen		= sizeof (int),
  1101			.mode		= 0444,
  1102			.proc_handler	= proc_dointvec,
  1103		},
  1104		{
  1105			.procname	= "bootloader_version",
  1106			.data		= &bootloader_version,
  1107			.maxlen		= sizeof (int),
  1108			.mode		= 0444,
  1109			.proc_handler	= proc_dointvec,
  1110		},
  1111		{
  1112			.procname	= "io_delay_type",
  1113			.data		= &io_delay_type,
  1114			.maxlen		= sizeof(int),
  1115			.mode		= 0644,
  1116			.proc_handler	= proc_dointvec,
  1117		},
  1118	#endif
  1119	#if defined(CONFIG_MMU)
  1120		{
  1121			.procname	= "randomize_va_space",
  1122			.data		= &randomize_va_space,
  1123			.maxlen		= sizeof(int),
  1124			.mode		= 0644,
  1125			.proc_handler	= proc_dointvec,
  1126		},
  1127	#endif
  1128	#if defined(CONFIG_S390) && defined(CONFIG_SMP)
  1129		{
  1130			.procname	= "spin_retry",
  1131			.data		= &spin_retry,
  1132			.maxlen		= sizeof (int),
  1133			.mode		= 0644,
  1134			.proc_handler	= proc_dointvec,
  1135		},
  1136	#endif
  1137	#if	defined(CONFIG_ACPI_SLEEP) && defined(CONFIG_X86)
  1138		{
  1139			.procname	= "acpi_video_flags",
  1140			.data		= &acpi_realmode_flags,
  1141			.maxlen		= sizeof (unsigned long),
  1142			.mode		= 0644,
  1143			.proc_handler	= proc_doulongvec_minmax,
  1144		},
  1145	#endif
  1146	#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
  1147		{
  1148			.procname	= "ignore-unaligned-usertrap",
  1149			.data		= &no_unaligned_warning,
  1150			.maxlen		= sizeof (int),
  1151		 	.mode		= 0644,
  1152			.proc_handler	= proc_dointvec,
  1153		},
  1154	#endif
  1155	#ifdef CONFIG_IA64
  1156		{
  1157			.procname	= "unaligned-dump-stack",
  1158			.data		= &unaligned_dump_stack,
  1159			.maxlen		= sizeof (int),
  1160			.mode		= 0644,
  1161			.proc_handler	= proc_dointvec,
  1162		},
  1163	#endif
  1164	#ifdef CONFIG_DETECT_HUNG_TASK
  1165		{
  1166			.procname	= "hung_task_panic",
  1167			.data		= &sysctl_hung_task_panic,
  1168			.maxlen		= sizeof(int),
  1169			.mode		= 0644,
  1170			.proc_handler	= proc_dointvec_minmax,
  1171			.extra1		= &zero,
  1172			.extra2		= &one,
  1173		},
  1174		{
  1175			.procname	= "hung_task_check_count",
  1176			.data		= &sysctl_hung_task_check_count,
  1177			.maxlen		= sizeof(int),
  1178			.mode		= 0644,
  1179			.proc_handler	= proc_dointvec_minmax,
  1180			.extra1		= &zero,
  1181		},
  1182		{
  1183			.procname	= "hung_task_timeout_secs",
  1184			.data		= &sysctl_hung_task_timeout_secs,
  1185			.maxlen		= sizeof(unsigned long),
  1186			.mode		= 0644,
  1187			.proc_handler	= proc_dohung_task_timeout_secs,
  1188			.extra2		= &hung_task_timeout_max,
  1189		},
  1190		{
  1191			.procname	= "hung_task_check_interval_secs",
  1192			.data		= &sysctl_hung_task_check_interval_secs,
  1193			.maxlen		= sizeof(unsigned long),
  1194			.mode		= 0644,
  1195			.proc_handler	= proc_dohung_task_timeout_secs,
  1196			.extra2		= &hung_task_timeout_max,
  1197		},
  1198		{
  1199			.procname	= "hung_task_warnings",
  1200			.data		= &sysctl_hung_task_warnings,
  1201			.maxlen		= sizeof(int),
  1202			.mode		= 0644,
  1203			.proc_handler	= proc_dointvec_minmax,
  1204			.extra1		= &neg_one,
  1205		},
  1206	#endif
  1207	#ifdef CONFIG_RT_MUTEXES
  1208		{
  1209			.procname	= "max_lock_depth",
  1210			.data		= &max_lock_depth,
  1211			.maxlen		= sizeof(int),
  1212			.mode		= 0644,
  1213			.proc_handler	= proc_dointvec,
  1214		},
  1215	#endif
  1216		{
  1217			.procname	= "poweroff_cmd",
  1218			.data		= &poweroff_cmd,
  1219			.maxlen		= POWEROFF_CMD_PATH_LEN,
  1220			.mode		= 0644,
  1221			.proc_handler	= proc_dostring,
  1222		},
  1223	#ifdef CONFIG_KEYS
  1224		{
  1225			.procname	= "keys",
  1226			.mode		= 0555,
  1227			.child		= key_sysctls,
  1228		},
  1229	#endif
  1230	#ifdef CONFIG_PERF_EVENTS
  1231		/*
  1232		 * User-space scripts rely on the existence of this file
  1233		 * as a feature check for perf_events being enabled.
  1234		 *
  1235		 * So it's an ABI, do not remove!
  1236		 */
  1237		{
  1238			.procname	= "perf_event_paranoid",
  1239			.data		= &sysctl_perf_event_paranoid,
  1240			.maxlen		= sizeof(sysctl_perf_event_paranoid),
  1241			.mode		= 0644,
  1242			.proc_handler	= proc_dointvec,
  1243		},
  1244		{
  1245			.procname	= "perf_event_mlock_kb",
  1246			.data		= &sysctl_perf_event_mlock,
  1247			.maxlen		= sizeof(sysctl_perf_event_mlock),
  1248			.mode		= 0644,
  1249			.proc_handler	= proc_dointvec,
  1250		},
  1251		{
  1252			.procname	= "perf_event_max_sample_rate",
  1253			.data		= &sysctl_perf_event_sample_rate,
  1254			.maxlen		= sizeof(sysctl_perf_event_sample_rate),
  1255			.mode		= 0644,
  1256			.proc_handler	= perf_proc_update_handler,
  1257			.extra1		= &one,
  1258		},
  1259		{
  1260			.procname	= "perf_cpu_time_max_percent",
  1261			.data		= &sysctl_perf_cpu_time_max_percent,
  1262			.maxlen		= sizeof(sysctl_perf_cpu_time_max_percent),
  1263			.mode		= 0644,
  1264			.proc_handler	= perf_cpu_time_max_percent_handler,
  1265			.extra1		= &zero,
  1266			.extra2		= &one_hundred,
  1267		},
  1268		{
  1269			.procname	= "perf_event_max_stack",
  1270			.data		= &sysctl_perf_event_max_stack,
  1271			.maxlen		= sizeof(sysctl_perf_event_max_stack),
  1272			.mode		= 0644,
  1273			.proc_handler	= perf_event_max_stack_handler,
  1274			.extra1		= &zero,
  1275			.extra2		= &six_hundred_forty_kb,
  1276		},
  1277		{
  1278			.procname	= "perf_event_max_contexts_per_stack",
  1279			.data		= &sysctl_perf_event_max_contexts_per_stack,
  1280			.maxlen		= sizeof(sysctl_perf_event_max_contexts_per_stack),
  1281			.mode		= 0644,
  1282			.proc_handler	= perf_event_max_stack_handler,
  1283			.extra1		= &zero,
  1284			.extra2		= &one_thousand,
  1285		},
  1286	#endif
  1287		{
  1288			.procname	= "panic_on_warn",
  1289			.data		= &panic_on_warn,
  1290			.maxlen		= sizeof(int),
  1291			.mode		= 0644,
  1292			.proc_handler	= proc_dointvec_minmax,
  1293			.extra1		= &zero,
  1294			.extra2		= &one,
  1295		},
  1296	#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
  1297		{
  1298			.procname	= "timer_migration",
  1299			.data		= &sysctl_timer_migration,
  1300			.maxlen		= sizeof(unsigned int),
  1301			.mode		= 0644,
  1302			.proc_handler	= timer_migration_handler,
  1303			.extra1		= &zero,
  1304			.extra2		= &one,
  1305		},
  1306	#endif
  1307	#ifdef CONFIG_BPF_SYSCALL
  1308		{
  1309			.procname	= "unprivileged_bpf_disabled",
  1310			.data		= &sysctl_unprivileged_bpf_disabled,
  1311			.maxlen		= sizeof(sysctl_unprivileged_bpf_disabled),
  1312			.mode		= 0644,
  1313			/* only handle a transition from default "0" to "1" */
  1314			.proc_handler	= proc_dointvec_minmax,
  1315			.extra1		= &one,
  1316			.extra2		= &one,
  1317		},
  1318	#endif
  1319	#if defined(CONFIG_TREE_RCU) || defined(CONFIG_PREEMPT_RCU)
  1320		{
  1321			.procname	= "panic_on_rcu_stall",
  1322			.data		= &sysctl_panic_on_rcu_stall,
  1323			.maxlen		= sizeof(sysctl_panic_on_rcu_stall),
  1324			.mode		= 0644,
  1325			.proc_handler	= proc_dointvec_minmax,
  1326			.extra1		= &zero,
  1327			.extra2		= &one,
  1328		},
  1329	#endif
  1330	#ifdef CONFIG_RICH_CONTAINER
  1331		{
  1332			.procname	= "rich_container_enable",
  1333			.data		= &sysctl_rich_container_enable,
  1334			.maxlen		= sizeof(int),
  1335			.mode		= 0600,
  1336			.proc_handler	= proc_dointvec_minmax,
  1337			.extra1		= &zero,
  1338			.extra2		= &one,
  1339		},
  1340	#ifndef CONFIG_RICH_CONTAINER_CG_SWITCH
  1341		{
  1342			.procname	= "rich_container_source",
  1343			.data		= &sysctl_rich_container_source,
  1344			.maxlen		= sizeof(int),
  1345			.mode		= 0600,
  1346			.proc_handler	= proc_dointvec_minmax,
  1347			.extra1		= &zero,
  1348			.extra2		= &one,
  1349		},
  1350		{
  1351			.procname	= "rich_container_cpuinfo_source",
  1352			.data		= &sysctl_rich_container_cpuinfo_source,
  1353			.maxlen		= sizeof(int),
  1354			.mode		= 0600,
  1355			.proc_handler	= proc_dointvec_minmax,
  1356			.extra1		= &zero,
  1357			.extra2		= &two,
  1358		},
  1359		{
  1360			.procname	= "rich_container_cpuinfo_sharesbase",
  1361			.data		= &sysctl_rich_container_cpuinfo_sharesbase,
  1362			.maxlen		= sizeof(int),
  1363			.mode		= 0600,
  1364			.proc_handler	= proc_douintvec_minmax,
  1365			.extra1		= &two,
  1366		},
  1367	#endif /* CONFIG_RICH_CONTAINER_CG_SWITCH */
  1368	#endif
  1369	#ifdef CONFIG_CGROUP_CACHE
  1370		{
  1371			.procname	= "cgroup_limit",
  1372			.data		= &cgroup_limit,
  1373			.maxlen		= sizeof(unsigned int),
  1374			.mode		= 0644,
  1375			.proc_handler	= cgroup_limit_handler,
  1376		},
  1377	#endif
  1378		{
  1379			.procname	= "cgroup_supply_delay_time",
> 1380			.data		= &cgroup_supply_delay_time,
  1381			.maxlen		= sizeof(unsigned int),
  1382			.mode		= 0644,
  1383			.proc_handler	= proc_dointvec,
  1384		},
  1385		{ }
  1386	};
  1387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
