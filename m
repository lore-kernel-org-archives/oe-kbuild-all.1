Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5474C9E0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768817; cv=none; b=m+m8BdxbOt8SPx8NiyLhwXdiWyp47Xwg1wcjdXJ2Z3Ak44XT6GnKqZqFkU+vmWV5o8AaNPcDKGbttkc/G5Ib3ljMWNPzWg41hyUhDQfNgY26BrXBtNm1k7Gl8gzg/suHcIqJ9JA159neh7vKRw7YP+UUMEv8WBVe2gRiZUCocb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768817; c=relaxed/simple;
	bh=MIx4UDYVocS0fW+qXPPbLrS/RfgURAQNiUlkXYxPaag=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cAs6TsuvTXTdeDNbUuAGUn8135O9W7Gfq1SahWECBeHyXd8CCEv3nkhgCEV5HKx8nxXDBMddLGLEvcQGrPJItRME8sf4Ybf36Dso6xaDR72GhGV4721vtX2etLRg/S3ItIRvvk/fMTMfRSN6VyfIQbDYS0f7n2EpmjYRJmHzEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wtz568rA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wtz568rA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790768814; x=1822304814;
  h=date:from:to:cc:subject:message-id;
  bh=MIx4UDYVocS0fW+qXPPbLrS/RfgURAQNiUlkXYxPaag=;
  b=Wtz568rAc53iYuyDZtJ6tZvuobIa58F7rWAttK8a4NW0VDJFKYDjqsq3
   MSVmj3gTopgC+G8lj6tSKrlo+FhrfEvkZwDdyvrgZbG0WDgfXt2nCD1/o
   NeTDy04PuMWgQy2922iGNF29xtYTn5ub7YB6ED99Ek/8RD2uWrpdnQnAN
   Rzk36pvPgNxY+SFDu1Gr6SPdzhAtKX6SNocPRmQdGVeETKa+c1E+YITad
   Lg/C2Nq0tT95nsTmY27edUqts9evUOpk6S9DS93KqTR+2RDX38g8ca57+
   iSgb4FoQ3VUikgL68S+r67noSlG9ozSqAD+/awUtQ4vQmrSTsRj4RhFep
   g==;
X-CSE-ConnectionGUID: +yX+Lon8TRi/7LCDmpsNQg==
X-CSE-MsgGUID: 4V6kVXlHSDmtdN1NCmehrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90545193"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90545193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:46:53 -0700
X-CSE-ConnectionGUID: DUOOxyFLQyKYUjzZnqQP+w==
X-CSE-MsgGUID: JiGm3ymcSvaB60ObuSSG0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="303604340"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2026 04:46:51 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBslt-000000001qR-0RAD;
	Wed, 30 Sep 2026 11:46:49 +0000
Date: Wed, 30 Sep 2026 13:46:26 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 21/26]
 drivers/attestation/providers/sim.c:1033:3: error: cannot jump from this goto
 statement to its label
Message-ID: <202609301305.xUbmwQPh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 70182d901dfdf94f8f611319f5bf3f7f6f18e1da [21/26] attestation: add the simulation provider
config: hexagon-randconfig-r2304-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301305.xUbmwQPh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1f84168f595dab2e23aab4181997da0a7f486dc7)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301305.xUbmwQPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301305.xUbmwQPh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/attestation/providers/sim.c:1033:3: error: cannot jump from this goto statement to its label
    1033 |                 goto err_mr;
         |                 ^
   drivers/attestation/providers/sim.c:1035:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1035 |         guard(mutex)(&fixture->control_lock);
         |         ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:81:1: note: expanded from here
      81 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:87:1: note: expanded from here
      87 | __UNIQUE_ID_unlock_315
         | ^
   drivers/attestation/providers/sim.c:1035:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:423:15: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:75:1: note: expanded from here
      75 | __UNIQUE_ID_guard_314
         | ^
   drivers/attestation/providers/sim.c:1029:3: error: cannot jump from this goto statement to its label
    1029 |                 goto err_mr;
         |                 ^
   drivers/attestation/providers/sim.c:1035:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1035 |         guard(mutex)(&fixture->control_lock);
         |         ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:81:1: note: expanded from here
      81 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:87:1: note: expanded from here
      87 | __UNIQUE_ID_unlock_315
         | ^
   drivers/attestation/providers/sim.c:1035:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:423:15: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:75:1: note: expanded from here
      75 | __UNIQUE_ID_guard_314
         | ^
   drivers/attestation/providers/sim.c:1015:3: error: cannot jump from this goto statement to its label
    1015 |                 goto err_mr;
         |                 ^
   drivers/attestation/providers/sim.c:1035:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
    1035 |         guard(mutex)(&fixture->control_lock);
         |         ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:81:1: note: expanded from here
      81 | class_mutex_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^


vim +1033 drivers/attestation/providers/sim.c

   969	
   970	static ssize_t attestation_sim_mr_add_write(struct file *file,
   971						    const char __user *buf,
   972						    size_t len, loff_t *ppos)
   973	{
   974		struct attestation_sim_fixture *fixture = file->private_data;
   975		char command[ATTESTATION_SIM_COMMAND_MAX + 1];
   976		struct attestation_sim_mr *mr;
   977		struct attestation_sim_mr *walk;
   978		struct attestation_mr *handle;
   979		char *cursor, *token;
   980		unsigned long walk_id;
   981		unsigned int id;
   982		size_t count = 0, mr_count = 0;
   983		int ret;
   984	
   985		ret = attestation_sim_copy_command(buf, len, command);
   986		if (ret)
   987			return ret;
   988		cursor = command;
   989		token = strsep(&cursor, " ");
   990		if (!token || kstrtouint(token, 0, &id) || id < 2)
   991			return -EINVAL;
   992		mr = kzalloc_obj(*mr, GFP_KERNEL);
   993		if (!mr)
   994			return -ENOMEM;
   995		mr->algorithms = kcalloc(HASH_ALGO__LAST,
   996					 sizeof(*mr->algorithms), GFP_KERNEL);
   997		if (!mr->algorithms) {
   998			ret = -ENOMEM;
   999			goto err_mr;
  1000		}
  1001		while ((token = strsep(&cursor, " "))) {
  1002			enum hash_algo algorithm;
  1003	
  1004			if (!*token)
  1005				continue;
  1006			ret = attestation_sim_algorithm_parse(token, &algorithm);
  1007			if (ret || (count && mr->algorithms[count - 1] >= algorithm)) {
  1008				ret = -EINVAL;
  1009				goto err_mr;
  1010			}
  1011			mr->algorithms[count++] = algorithm;
  1012		}
  1013		if (!count) {
  1014			ret = -EINVAL;
  1015			goto err_mr;
  1016		}
  1017		mr->props = (struct attestation_mr_props) {
  1018			.id = id,
  1019			.algorithms = mr->algorithms,
  1020			.algorithms_count = count,
  1021			.has_register_index = true,
  1022			.register_index = id,
  1023			.readable = true,
  1024			.extendable = true,
  1025		};
  1026		mr->props.name = kasprintf(GFP_KERNEL, "sim-dynamic-%u", id);
  1027		if (!mr->props.name) {
  1028			ret = -ENOMEM;
  1029			goto err_mr;
  1030		}
  1031		ret = attestation_sim_mr_init(mr, &mr->props);
  1032		if (ret)
> 1033			goto err_mr;
  1034	
  1035		guard(mutex)(&fixture->control_lock);
  1036		if (fixture->dead || !fixture->sim) {
  1037			ret = -ENODEV;
  1038			goto err_mr;
  1039		}
  1040		scoped_guard(mutex, &fixture->sim->hardware_lock) {
  1041			xa_for_each(&fixture->sim->dynamic_mrs, walk_id, walk)
  1042				mr_count++;
  1043			if (mr_count >= ATTESTATION_SIM_DYNAMIC_MRS_MAX) {
  1044				ret = -ENOSPC;
  1045				goto err_mr;
  1046			}
  1047			if (xa_load(&fixture->sim->dynamic_mrs, id)) {
  1048				ret = -EEXIST;
  1049				goto err_mr;
  1050			}
  1051			ret = xa_insert(&fixture->sim->dynamic_mrs, id, mr,
  1052					GFP_KERNEL);
  1053			if (!ret)
  1054				fixture->sim->notification_pending = true;
  1055		}
  1056		if (ret)
  1057			goto err_mr;
  1058		handle = attestation_mr_create(
  1059			ctlv_priv_parent(fixture->sim), &mr->props);
  1060		if (IS_ERR(handle)) {
  1061			ret = PTR_ERR(handle);
  1062			scoped_guard(mutex, &fixture->sim->hardware_lock) {
  1063				xa_erase(&fixture->sim->dynamic_mrs, id);
  1064				fixture->sim->notification_pending = false;
  1065			}
  1066			goto err_mr;
  1067		}
  1068		scoped_guard(mutex, &fixture->sim->hardware_lock) {
  1069			mr->handle = handle;
  1070			fixture->sim->notification_pending = false;
  1071		}
  1072		return len;
  1073	
  1074	err_mr:
  1075		attestation_sim_mr_fini(mr);
  1076		return ret;
  1077	}
  1078	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
