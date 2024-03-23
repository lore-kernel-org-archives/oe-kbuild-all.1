Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D31523C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711213453; cv=none; b=H8mHzQEVcsQy3QiqIaWNODHpW9qkcIW+TRgOXTPUXse7ipvyEyg/aYLKDU0D1Q5fW+e9PTGIQv5b5tJ7oXxCN+/Z4xHLS1+2Vtt80P9EaIk4BSei3ar2HipVAfUl+kgjR+Xn+qDLSTus1R6GM0N74bojCfNG0ccsLymNP096iG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711213453; c=relaxed/simple;
	bh=GIbw03I63O+6q8vNU9ECiwh9x1+fAE1V0c0zmAtSo8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSIW+ckEW9W8UtVReaWqzsyJ4pnHv89KfXGsDVoTp4hFC0T8DLtdN6lOxvhC7akMti91sfu3D6Df+BXo709+y6ekCQe1ExNWwag/Xf9E3nEMU/GbeYzdqLpvSB2DiWSQArkENmZN7y3ikhXLkUNU9ivuDIof/j/Sy3qCzwtF7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVZBClwh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVZBClwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711213451; x=1742749451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIbw03I63O+6q8vNU9ECiwh9x1+fAE1V0c0zmAtSo8g=;
  b=hVZBClwhErPO8QYcpRftfJg8UMnjyMSgLt4LWCPEzuvizVK8UbLssddP
   3x1pJMedTgsIiu1pUQT5ngJKfBkAfpMlyERewJ7ROb/4lKnQbwxdpsfb+
   blBsNYMdIJi9J/Gk+yh/eR8fGh/aASNI6sTQbeLJAcUiSRDCvcLhqy9bp
   2yxHWvCF+vEZhlTUGBLBUaucwhaEOPJnRxFdYyvuPOuHRfwN6M9kNV8i8
   Jfba38uPbyMIIxRvEv50sJWNe3nZgYLYetOt6Zb2Z8qu7mqbMSJso6nuD
   nIV60WkLD4ftKPTLygG5ZHKLF9aTw6wcADwisexI929hbRYqvH1B1Inhd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6367533"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6367533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 10:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15651112"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2024 10:04:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro4mq-000LLH-32;
	Sat, 23 Mar 2024 17:04:04 +0000
Date: Sun, 24 Mar 2024 01:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2165/30000] kernel/livepatch/core.c:1102:5:
 warning: no previous prototype for function 'klp_try_disable_patch'
Message-ID: <202403240050.7nMqX49L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: c33e42836a745f2b3ab28bd6cb09c208cbcc950e [2165/30000] livepatch/core: Allow implementation without ftrace
config: x86_64-randconfig-015-20240323 (https://download.01.org/0day-ci/archive/20240324/202403240050.7nMqX49L-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240050.7nMqX49L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240050.7nMqX49L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:1084:12: warning: no previous prototype for function 'klp_check_calltrace' [-Wmissing-prototypes]
    1084 | int __weak klp_check_calltrace(struct klp_patch *patch, int enable)
         |            ^
   kernel/livepatch/core.c:1084:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1084 | int __weak klp_check_calltrace(struct klp_patch *patch, int enable)
         | ^
         | static 
   kernel/livepatch/core.c:1107:27: error: incomplete definition of type 'struct patch_data'
    1107 |         if (atomic_inc_return(&pd->cpu_count) == 1) {
         |                                ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1108:31: error: incomplete definition of type 'struct patch_data'
    1108 |                 struct klp_patch *patch = pd->patch;
         |                                           ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1112:18: error: incomplete definition of type 'struct patch_data'
    1112 |                         atomic_inc(&pd->cpu_count);
         |                                     ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1117:18: error: incomplete definition of type 'struct patch_data'
    1117 |                         atomic_inc(&pd->cpu_count);
         |                                     ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1120:17: error: incomplete definition of type 'struct patch_data'
    1120 |                 atomic_inc(&pd->cpu_count);
         |                             ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1122:25: error: incomplete definition of type 'struct patch_data'
    1122 |                 while (atomic_read(&pd->cpu_count) <= num_online_cpus())
         |                                     ~~^
   kernel/livepatch/core.c:1105:9: note: forward declaration of 'struct patch_data'
    1105 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
>> kernel/livepatch/core.c:1102:5: warning: no previous prototype for function 'klp_try_disable_patch' [-Wmissing-prototypes]
    1102 | int klp_try_disable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1102 | int klp_try_disable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1134:20: error: variable has incomplete type 'struct patch_data'
    1134 |         struct patch_data patch_data = {
         |                           ^
   kernel/livepatch/core.c:1134:9: note: forward declaration of 'struct patch_data'
    1134 |         struct patch_data patch_data = {
         |                ^
   kernel/livepatch/core.c:1151:8: error: implicit declaration of function 'stop_machine' [-Werror,-Wimplicit-function-declaration]
    1151 |         ret = stop_machine(klp_try_disable_patch, &patch_data, cpu_online_mask);
         |               ^
   kernel/livepatch/core.c:1258:27: error: incomplete definition of type 'struct patch_data'
    1258 |         if (atomic_inc_return(&pd->cpu_count) == 1) {
         |                                ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1259:31: error: incomplete definition of type 'struct patch_data'
    1259 |                 struct klp_patch *patch = pd->patch;
         |                                           ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1263:18: error: incomplete definition of type 'struct patch_data'
    1263 |                         atomic_inc(&pd->cpu_count);
         |                                     ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1268:18: error: incomplete definition of type 'struct patch_data'
    1268 |                         atomic_inc(&pd->cpu_count);
         |                                     ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1271:17: error: incomplete definition of type 'struct patch_data'
    1271 |                 atomic_inc(&pd->cpu_count);
         |                             ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
   kernel/livepatch/core.c:1273:25: error: incomplete definition of type 'struct patch_data'
    1273 |                 while (atomic_read(&pd->cpu_count) <= num_online_cpus())
         |                                     ~~^
   kernel/livepatch/core.c:1256:9: note: forward declaration of 'struct patch_data'
    1256 |         struct patch_data *pd = (struct patch_data *)data;
         |                ^
>> kernel/livepatch/core.c:1253:5: warning: no previous prototype for function 'klp_try_enable_patch' [-Wmissing-prototypes]
    1253 | int klp_try_enable_patch(void *data)
         |     ^
   kernel/livepatch/core.c:1253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1253 | int klp_try_enable_patch(void *data)
         | ^
         | static 
   kernel/livepatch/core.c:1285:20: error: variable has incomplete type 'struct patch_data'
    1285 |         struct patch_data patch_data = {
         |                           ^
   kernel/livepatch/core.c:1285:9: note: forward declaration of 'struct patch_data'
    1285 |         struct patch_data patch_data = {
         |                ^
   kernel/livepatch/core.c:1302:8: error: implicit declaration of function 'stop_machine' [-Werror,-Wimplicit-function-declaration]
    1302 |         ret = stop_machine(klp_try_enable_patch, &patch_data, cpu_online_mask);
         |               ^
   3 warnings and 16 errors generated.


vim +/klp_try_disable_patch +1102 kernel/livepatch/core.c

  1101	
> 1102	int klp_try_disable_patch(void *data)
  1103	{
  1104		int ret = 0;
> 1105		struct patch_data *pd = (struct patch_data *)data;
  1106	
  1107		if (atomic_inc_return(&pd->cpu_count) == 1) {
  1108			struct klp_patch *patch = pd->patch;
  1109	
  1110			ret = klp_check_calltrace(patch, 0);
  1111			if (ret) {
  1112				atomic_inc(&pd->cpu_count);
  1113				return ret;
  1114			}
  1115			ret = disable_patch(patch);
  1116			if (ret) {
  1117				atomic_inc(&pd->cpu_count);
  1118				return ret;
  1119			}
  1120			atomic_inc(&pd->cpu_count);
  1121		} else {
  1122			while (atomic_read(&pd->cpu_count) <= num_online_cpus())
  1123				cpu_relax();
  1124	
  1125			klp_smp_isb();
  1126		}
  1127	
  1128		return ret;
  1129	}
  1130	
  1131	static int __klp_disable_patch(struct klp_patch *patch)
  1132	{
  1133		int ret;
  1134		struct patch_data patch_data = {
  1135			.patch = patch,
  1136			.cpu_count = ATOMIC_INIT(0),
  1137		};
  1138	
  1139		if (WARN_ON(!patch->enabled))
  1140			return -EINVAL;
  1141	
  1142	#ifdef CONFIG_LIVEPATCH_STACK
  1143		/* enforce stacking: only the last enabled patch can be disabled */
  1144		if (!list_is_last(&patch->list, &klp_patches) &&
  1145		    list_next_entry(patch, list)->enabled) {
  1146			pr_err("only the last enabled patch can be disabled\n");
  1147			return -EBUSY;
  1148		}
  1149	#endif
  1150	
  1151		ret = stop_machine(klp_try_disable_patch, &patch_data, cpu_online_mask);
  1152		if (ret)
  1153			return ret;
  1154	
  1155		klp_free_patch_async(patch);
  1156		return 0;
  1157	}
  1158	#endif /* ifdef CONFIG_LIVEPATCH_FTRACE */
  1159	
  1160	#ifdef CONFIG_LIVEPATCH_FTRACE
  1161	static int __klp_enable_patch(struct klp_patch *patch)
  1162	{
  1163		struct klp_object *obj;
  1164		int ret;
  1165	
  1166		if (klp_transition_patch)
  1167			return -EBUSY;
  1168	
  1169		if (WARN_ON(patch->enabled))
  1170			return -EINVAL;
  1171	
  1172		pr_notice("enabling patch '%s'\n", patch->mod->name);
  1173	
  1174		klp_init_transition(patch, KLP_PATCHED);
  1175	
  1176		/*
  1177		 * Enforce the order of the func->transition writes in
  1178		 * klp_init_transition() and the ops->func_stack writes in
  1179		 * klp_patch_object(), so that klp_ftrace_handler() will see the
  1180		 * func->transition updates before the handler is registered and the
  1181		 * new funcs become visible to the handler.
  1182		 */
  1183		smp_wmb();
  1184	
  1185		klp_for_each_object(patch, obj) {
  1186			if (!klp_is_object_loaded(obj))
  1187				continue;
  1188	
  1189			ret = klp_pre_patch_callback(obj);
  1190			if (ret) {
  1191				pr_warn("pre-patch callback failed for object '%s'\n",
  1192					klp_is_module(obj) ? obj->name : "vmlinux");
  1193				goto err;
  1194			}
  1195	
  1196			ret = klp_patch_object(obj);
  1197			if (ret) {
  1198				pr_warn("failed to patch object '%s'\n",
  1199					klp_is_module(obj) ? obj->name : "vmlinux");
  1200				goto err;
  1201			}
  1202		}
  1203	
  1204		klp_start_transition();
  1205		patch->enabled = true;
  1206		klp_try_complete_transition();
  1207	
  1208		return 0;
  1209	err:
  1210		pr_warn("failed to enable patch '%s'\n", patch->mod->name);
  1211	
  1212		klp_cancel_transition();
  1213		return ret;
  1214	}
  1215	#else /* ifdef CONFIG_LIVEPATCH_WO_FTRACE */
  1216	/*
  1217	 * This function is called from stop_machine() context.
  1218	 */
  1219	static int enable_patch(struct klp_patch *patch)
  1220	{
  1221		struct klp_object *obj;
  1222		int ret;
  1223	
  1224		pr_notice_once("tainting kernel with TAINT_LIVEPATCH\n");
  1225		add_taint(TAINT_LIVEPATCH, LOCKDEP_STILL_OK);
  1226	
  1227		if (!try_module_get(patch->mod))
  1228			return -ENODEV;
  1229	
  1230		patch->enabled = true;
  1231	
  1232		pr_notice("enabling patch '%s'\n", patch->mod->name);
  1233	
  1234		klp_for_each_object(patch, obj) {
  1235			if (!klp_is_object_loaded(obj))
  1236				continue;
  1237	
  1238			ret = klp_patch_object(obj);
  1239			if (ret) {
  1240				pr_warn("failed to patch object '%s'\n",
  1241					klp_is_module(obj) ? obj->name : "vmlinux");
  1242				goto disable;
  1243			}
  1244		}
  1245	
  1246		return 0;
  1247	
  1248	disable:
  1249		disable_patch(patch);
  1250		return ret;
  1251	}
  1252	
> 1253	int klp_try_enable_patch(void *data)
  1254	{
  1255		int ret = 0;
> 1256		struct patch_data *pd = (struct patch_data *)data;
  1257	
  1258		if (atomic_inc_return(&pd->cpu_count) == 1) {
  1259			struct klp_patch *patch = pd->patch;
  1260	
  1261			ret = klp_check_calltrace(patch, 1);
  1262			if (ret) {
  1263				atomic_inc(&pd->cpu_count);
  1264				return ret;
  1265			}
  1266			ret = enable_patch(patch);
  1267			if (ret) {
  1268				atomic_inc(&pd->cpu_count);
  1269				return ret;
  1270			}
  1271			atomic_inc(&pd->cpu_count);
  1272		} else {
  1273			while (atomic_read(&pd->cpu_count) <= num_online_cpus())
  1274				cpu_relax();
  1275	
  1276			klp_smp_isb();
  1277		}
  1278	
  1279		return ret;
  1280	}
  1281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
