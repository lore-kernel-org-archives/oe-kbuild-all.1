Content-Type: multipart/mixed; boundary="===============8200807801450027413=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/muqss 9/22] kernel/sysctl.c:1129:15: error: 'one' undeclared here (not in a function); did you mean 'zone'?
Date: Sun, 02 Feb 2020 22:35:45 +0800
Message-ID: <202002022235.d5YR65rN%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8200807801450027413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/muqss
head:   bf569053d0fe08b3615793a0105afff3d28f3676
commit: fc0355925085383ffdcbec9d4ecc2a17ca2547e3 [9/22] Make hrtimer granul=
arity and minimum hrtimeout configurable in sysctl. Set default granularity=
 to 100us and min timeout to 500us.
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        git checkout fc0355925085383ffdcbec9d4ecc2a17ca2547e3
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the zen-kernel-zen-kernel/5.5/muqss HEAD bf569053d0fe08b3615793a0105a=
fff3d28f3676 builds fine.
      It only hurts bisectibility.

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1129:15: error: 'one' undeclared here (not in a function=
); did you mean 'zone'?
      .extra1  =3D &one,
                  ^~~
                  zone

vim +1129 kernel/sysctl.c

  1020	=

  1021	#if defined(CONFIG_X86_LOCAL_APIC) && defined(CONFIG_X86)
  1022		{
  1023			.procname       =3D "unknown_nmi_panic",
  1024			.data           =3D &unknown_nmi_panic,
  1025			.maxlen         =3D sizeof (int),
  1026			.mode           =3D 0644,
  1027			.proc_handler   =3D proc_dointvec,
  1028		},
  1029	#endif
  1030	#if defined(CONFIG_X86)
  1031		{
  1032			.procname	=3D "panic_on_unrecovered_nmi",
  1033			.data		=3D &panic_on_unrecovered_nmi,
  1034			.maxlen		=3D sizeof(int),
  1035			.mode		=3D 0644,
  1036			.proc_handler	=3D proc_dointvec,
  1037		},
  1038		{
  1039			.procname	=3D "panic_on_io_nmi",
  1040			.data		=3D &panic_on_io_nmi,
  1041			.maxlen		=3D sizeof(int),
  1042			.mode		=3D 0644,
  1043			.proc_handler	=3D proc_dointvec,
  1044		},
  1045	#ifdef CONFIG_DEBUG_STACKOVERFLOW
  1046		{
  1047			.procname	=3D "panic_on_stackoverflow",
  1048			.data		=3D &sysctl_panic_on_stackoverflow,
  1049			.maxlen		=3D sizeof(int),
  1050			.mode		=3D 0644,
  1051			.proc_handler	=3D proc_dointvec,
  1052		},
  1053	#endif
  1054		{
  1055			.procname	=3D "bootloader_type",
  1056			.data		=3D &bootloader_type,
  1057			.maxlen		=3D sizeof (int),
  1058			.mode		=3D 0444,
  1059			.proc_handler	=3D proc_dointvec,
  1060		},
  1061		{
  1062			.procname	=3D "bootloader_version",
  1063			.data		=3D &bootloader_version,
  1064			.maxlen		=3D sizeof (int),
  1065			.mode		=3D 0444,
  1066			.proc_handler	=3D proc_dointvec,
  1067		},
  1068		{
  1069			.procname	=3D "io_delay_type",
  1070			.data		=3D &io_delay_type,
  1071			.maxlen		=3D sizeof(int),
  1072			.mode		=3D 0644,
  1073			.proc_handler	=3D proc_dointvec,
  1074		},
  1075	#endif
  1076	#if defined(CONFIG_MMU)
  1077		{
  1078			.procname	=3D "randomize_va_space",
  1079			.data		=3D &randomize_va_space,
  1080			.maxlen		=3D sizeof(int),
  1081			.mode		=3D 0644,
  1082			.proc_handler	=3D proc_dointvec,
  1083		},
  1084	#endif
  1085	#ifdef CONFIG_SCHED_MUQSS
  1086		{
  1087			.procname	=3D "rr_interval",
  1088			.data		=3D &rr_interval,
  1089			.maxlen		=3D sizeof (int),
  1090			.mode		=3D 0644,
  1091			.proc_handler	=3D &proc_dointvec_minmax,
  1092			.extra1		=3D &one,
  1093			.extra2		=3D &one_thousand,
  1094		},
  1095		{
  1096			.procname	=3D "interactive",
  1097			.data		=3D &sched_interactive,
  1098			.maxlen		=3D sizeof(int),
  1099			.mode		=3D 0644,
  1100			.proc_handler	=3D &proc_dointvec_minmax,
  1101			.extra1		=3D &zero,
  1102			.extra2		=3D &one,
  1103		},
  1104		{
  1105			.procname	=3D "iso_cpu",
  1106			.data		=3D &sched_iso_cpu,
  1107			.maxlen		=3D sizeof (int),
  1108			.mode		=3D 0644,
  1109			.proc_handler	=3D &proc_dointvec_minmax,
  1110			.extra1		=3D &zero,
  1111			.extra2		=3D &one_hundred,
  1112		},
  1113		{
  1114			.procname	=3D "yield_type",
  1115			.data		=3D &sched_yield_type,
  1116			.maxlen		=3D sizeof (int),
  1117			.mode		=3D 0644,
  1118			.proc_handler	=3D &proc_dointvec_minmax,
  1119			.extra1		=3D &zero,
  1120			.extra2		=3D &two,
  1121		},
  1122	#endif
  1123		{
  1124			.procname	=3D "hrtimer_granularity_us",
  1125			.data		=3D &hrtimer_granularity_us,
  1126			.maxlen		=3D sizeof(int),
  1127			.mode		=3D 0644,
  1128			.proc_handler	=3D &proc_dointvec_minmax,
> 1129			.extra1		=3D &one,
  1130			.extra2		=3D &ten_thousand,
  1131		},
  1132		{
  1133			.procname	=3D "hrtimeout_min_us",
  1134			.data		=3D &hrtimeout_min_us,
  1135			.maxlen		=3D sizeof(int),
  1136			.mode		=3D 0644,
  1137			.proc_handler	=3D &proc_dointvec_minmax,
  1138			.extra1		=3D &one,
  1139			.extra2		=3D &ten_thousand,
  1140		},
  1141	#if defined(CONFIG_S390) && defined(CONFIG_SMP)
  1142		{
  1143			.procname	=3D "spin_retry",
  1144			.data		=3D &spin_retry,
  1145			.maxlen		=3D sizeof (int),
  1146			.mode		=3D 0644,
  1147			.proc_handler	=3D proc_dointvec,
  1148		},
  1149	#endif
  1150	#if	defined(CONFIG_ACPI_SLEEP) && defined(CONFIG_X86)
  1151		{
  1152			.procname	=3D "acpi_video_flags",
  1153			.data		=3D &acpi_realmode_flags,
  1154			.maxlen		=3D sizeof (unsigned long),
  1155			.mode		=3D 0644,
  1156			.proc_handler	=3D proc_doulongvec_minmax,
  1157		},
  1158	#endif
  1159	#ifdef CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN
  1160		{
  1161			.procname	=3D "ignore-unaligned-usertrap",
  1162			.data		=3D &no_unaligned_warning,
  1163			.maxlen		=3D sizeof (int),
  1164		 	.mode		=3D 0644,
  1165			.proc_handler	=3D proc_dointvec,
  1166		},
  1167	#endif
  1168	#ifdef CONFIG_IA64
  1169		{
  1170			.procname	=3D "unaligned-dump-stack",
  1171			.data		=3D &unaligned_dump_stack,
  1172			.maxlen		=3D sizeof (int),
  1173			.mode		=3D 0644,
  1174			.proc_handler	=3D proc_dointvec,
  1175		},
  1176	#endif
  1177	#ifdef CONFIG_DETECT_HUNG_TASK
  1178		{
  1179			.procname	=3D "hung_task_panic",
  1180			.data		=3D &sysctl_hung_task_panic,
  1181			.maxlen		=3D sizeof(int),
  1182			.mode		=3D 0644,
  1183			.proc_handler	=3D proc_dointvec_minmax,
  1184			.extra1		=3D SYSCTL_ZERO,
  1185			.extra2		=3D SYSCTL_ONE,
  1186		},
  1187		{
  1188			.procname	=3D "hung_task_check_count",
  1189			.data		=3D &sysctl_hung_task_check_count,
  1190			.maxlen		=3D sizeof(int),
  1191			.mode		=3D 0644,
  1192			.proc_handler	=3D proc_dointvec_minmax,
  1193			.extra1		=3D SYSCTL_ZERO,
  1194		},
  1195		{
  1196			.procname	=3D "hung_task_timeout_secs",
  1197			.data		=3D &sysctl_hung_task_timeout_secs,
  1198			.maxlen		=3D sizeof(unsigned long),
  1199			.mode		=3D 0644,
  1200			.proc_handler	=3D proc_dohung_task_timeout_secs,
  1201			.extra2		=3D &hung_task_timeout_max,
  1202		},
  1203		{
  1204			.procname	=3D "hung_task_check_interval_secs",
  1205			.data		=3D &sysctl_hung_task_check_interval_secs,
  1206			.maxlen		=3D sizeof(unsigned long),
  1207			.mode		=3D 0644,
  1208			.proc_handler	=3D proc_dohung_task_timeout_secs,
  1209			.extra2		=3D &hung_task_timeout_max,
  1210		},
  1211		{
  1212			.procname	=3D "hung_task_warnings",
  1213			.data		=3D &sysctl_hung_task_warnings,
  1214			.maxlen		=3D sizeof(int),
  1215			.mode		=3D 0644,
  1216			.proc_handler	=3D proc_dointvec_minmax,
  1217			.extra1		=3D &neg_one,
  1218		},
  1219	#endif
  1220	#ifdef CONFIG_RT_MUTEXES
  1221		{
  1222			.procname	=3D "max_lock_depth",
  1223			.data		=3D &max_lock_depth,
  1224			.maxlen		=3D sizeof(int),
  1225			.mode		=3D 0644,
  1226			.proc_handler	=3D proc_dointvec,
  1227		},
  1228	#endif
  1229		{
  1230			.procname	=3D "poweroff_cmd",
  1231			.data		=3D &poweroff_cmd,
  1232			.maxlen		=3D POWEROFF_CMD_PATH_LEN,
  1233			.mode		=3D 0644,
  1234			.proc_handler	=3D proc_dostring,
  1235		},
  1236	#ifdef CONFIG_KEYS
  1237		{
  1238			.procname	=3D "keys",
  1239			.mode		=3D 0555,
  1240			.child		=3D key_sysctls,
  1241		},
  1242	#endif
  1243	#ifdef CONFIG_PERF_EVENTS
  1244		/*
  1245		 * User-space scripts rely on the existence of this file
  1246		 * as a feature check for perf_events being enabled.
  1247		 *
  1248		 * So it's an ABI, do not remove!
  1249		 */
  1250		{
  1251			.procname	=3D "perf_event_paranoid",
  1252			.data		=3D &sysctl_perf_event_paranoid,
  1253			.maxlen		=3D sizeof(sysctl_perf_event_paranoid),
  1254			.mode		=3D 0644,
  1255			.proc_handler	=3D proc_dointvec,
  1256		},
  1257		{
  1258			.procname	=3D "perf_event_mlock_kb",
  1259			.data		=3D &sysctl_perf_event_mlock,
  1260			.maxlen		=3D sizeof(sysctl_perf_event_mlock),
  1261			.mode		=3D 0644,
  1262			.proc_handler	=3D proc_dointvec,
  1263		},
  1264		{
  1265			.procname	=3D "perf_event_max_sample_rate",
  1266			.data		=3D &sysctl_perf_event_sample_rate,
  1267			.maxlen		=3D sizeof(sysctl_perf_event_sample_rate),
  1268			.mode		=3D 0644,
  1269			.proc_handler	=3D perf_proc_update_handler,
  1270			.extra1		=3D SYSCTL_ONE,
  1271		},
  1272		{
  1273			.procname	=3D "perf_cpu_time_max_percent",
  1274			.data		=3D &sysctl_perf_cpu_time_max_percent,
  1275			.maxlen		=3D sizeof(sysctl_perf_cpu_time_max_percent),
  1276			.mode		=3D 0644,
  1277			.proc_handler	=3D perf_cpu_time_max_percent_handler,
  1278			.extra1		=3D SYSCTL_ZERO,
  1279			.extra2		=3D &one_hundred,
  1280		},
  1281		{
  1282			.procname	=3D "perf_event_max_stack",
  1283			.data		=3D &sysctl_perf_event_max_stack,
  1284			.maxlen		=3D sizeof(sysctl_perf_event_max_stack),
  1285			.mode		=3D 0644,
  1286			.proc_handler	=3D perf_event_max_stack_handler,
  1287			.extra1		=3D SYSCTL_ZERO,
  1288			.extra2		=3D &six_hundred_forty_kb,
  1289		},
  1290		{
  1291			.procname	=3D "perf_event_max_contexts_per_stack",
  1292			.data		=3D &sysctl_perf_event_max_contexts_per_stack,
  1293			.maxlen		=3D sizeof(sysctl_perf_event_max_contexts_per_stack),
  1294			.mode		=3D 0644,
  1295			.proc_handler	=3D perf_event_max_stack_handler,
  1296			.extra1		=3D SYSCTL_ZERO,
  1297			.extra2		=3D &one_thousand,
  1298		},
  1299	#endif
  1300		{
  1301			.procname	=3D "panic_on_warn",
  1302			.data		=3D &panic_on_warn,
  1303			.maxlen		=3D sizeof(int),
  1304			.mode		=3D 0644,
  1305			.proc_handler	=3D proc_dointvec_minmax,
  1306			.extra1		=3D SYSCTL_ZERO,
  1307			.extra2		=3D SYSCTL_ONE,
  1308		},
  1309	#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
  1310		{
  1311			.procname	=3D "timer_migration",
  1312			.data		=3D &sysctl_timer_migration,
  1313			.maxlen		=3D sizeof(unsigned int),
  1314			.mode		=3D 0644,
  1315			.proc_handler	=3D timer_migration_handler,
  1316			.extra1		=3D SYSCTL_ZERO,
  1317			.extra2		=3D SYSCTL_ONE,
  1318		},
  1319	#endif
  1320	#ifdef CONFIG_BPF_SYSCALL
  1321		{
  1322			.procname	=3D "unprivileged_bpf_disabled",
  1323			.data		=3D &sysctl_unprivileged_bpf_disabled,
  1324			.maxlen		=3D sizeof(sysctl_unprivileged_bpf_disabled),
  1325			.mode		=3D 0644,
  1326			/* only handle a transition from default "0" to "1" */
  1327			.proc_handler	=3D proc_dointvec_minmax,
  1328			.extra1		=3D SYSCTL_ONE,
  1329			.extra2		=3D SYSCTL_ONE,
  1330		},
  1331		{
  1332			.procname	=3D "bpf_stats_enabled",
  1333			.data		=3D &bpf_stats_enabled_key.key,
  1334			.maxlen		=3D sizeof(bpf_stats_enabled_key),
  1335			.mode		=3D 0644,
  1336			.proc_handler	=3D proc_do_static_key,
  1337		},
  1338	#endif
  1339	#if defined(CONFIG_TREE_RCU) || defined(CONFIG_PREEMPT_RCU)
  1340		{
  1341			.procname	=3D "panic_on_rcu_stall",
  1342			.data		=3D &sysctl_panic_on_rcu_stall,
  1343			.maxlen		=3D sizeof(sysctl_panic_on_rcu_stall),
  1344			.mode		=3D 0644,
  1345			.proc_handler	=3D proc_dointvec_minmax,
  1346			.extra1		=3D SYSCTL_ZERO,
  1347			.extra2		=3D SYSCTL_ONE,
  1348		},
  1349	#endif
  1350	#ifdef CONFIG_STACKLEAK_RUNTIME_DISABLE
  1351		{
  1352			.procname	=3D "stack_erasing",
  1353			.data		=3D NULL,
  1354			.maxlen		=3D sizeof(int),
  1355			.mode		=3D 0600,
  1356			.proc_handler	=3D stack_erasing_sysctl,
  1357			.extra1		=3D SYSCTL_ZERO,
  1358			.extra2		=3D SYSCTL_ONE,
  1359		},
  1360	#endif
  1361		{ }
  1362	};
  1363	=


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============8200807801450027413==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
D9lgwiJSggAA
--===============8200807801450027413==--

