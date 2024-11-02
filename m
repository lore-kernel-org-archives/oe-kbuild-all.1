Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9CE1BC41
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 02:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730513114; cv=none; b=lnEr+ijpXMi5FrkKZRsJUVdOX0atGvxGl2YI4JzIhdAJ+/mEUITpe+tLslC/N+XnIn0SKBcWU4LcVq1DCQILBhBg9jU8zq2b09WKvjMln4ofmGI/c3JxzFE97NuxAZdjq6scm7IHJnq3BTaVxeKUuO+gYMdfHO8fmu1iftAsfKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730513114; c=relaxed/simple;
	bh=XhoSGciqlXqLvea4Fb30b5jck9wlI2d5rQB0anpr26Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZEcHvI5wjfrSjuPEgZjq1ITj90wqtJtL/3lKRFLwubErN7ic8B2+ZYt7u3gqwrSxkrhFwi3iV3/PR9kUU6ZMzzCzucMQewZajr2KK/jwXtyhJKTRRYtTEI8QpWq6GNoQ139QzaRI9cjjd0iV3iSAqi1kol/sVNtWH08M8SEcVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/lv7n1U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/lv7n1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730513113; x=1762049113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XhoSGciqlXqLvea4Fb30b5jck9wlI2d5rQB0anpr26Y=;
  b=c/lv7n1UT5SNGQaw5w0LC/oJVvWClP8LjCSKsByG5LwoXLHKdd9Qujpp
   lGzivxBzltmGnXYceQ9aN3qsu/4aM//Iv5SbZ9SPbS9VJxMThrtmp7OsB
   qRy0hd+hjcPEX3N31cWifRYQ4ycLhStgZPo+r72Glx27ivGsPpodV+R8W
   Xjx3E8fvs8q2O0mMJ+4ayr6h5RwmnEjTK3mCYDdw8I6J3NJhRRx+Z2gBB
   DmVWSEcRI78elnmqI1jC7jCyCg7Xyi0UVukLGErUrGYxea/j4yHpltpCi
   LF4A2N5/U8qwgOomTZC5+/o/kpxMeGYuVvp7lN9kFGZ55trnD5GEThEnu
   w==;
X-CSE-ConnectionGUID: ei0H7Su9TtSCMgFHxXYGeQ==
X-CSE-MsgGUID: etuvUC7iQtOvPJ4drLgo0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="33127547"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="33127547"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 19:05:12 -0700
X-CSE-ConnectionGUID: 2YAg1oaVQh2Uf32Pt86PHA==
X-CSE-MsgGUID: Ev1FUTGKQNaPErrD5F7OmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="87941871"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2024 19:05:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t73Vk-000iIl-0N;
	Sat, 02 Nov 2024 02:05:08 +0000
Date: Sat, 2 Nov 2024 10:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chench00 <chench@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1344/1344]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous
 prototype for function 'kprobe_symbol_address_byname'
Message-ID: <202411020918.At8pfay4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4cd9ac5bb21892408b1fd5332f7fbea44a16b61e
commit: 3ad98583441f7c8a2553e1e8d6340ed4397033e2 [1344/1344] crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM
config: x86_64-buildonly-randconfig-003-20241102 (https://download.01.org/0day-ci/archive/20241102/202411020918.At8pfay4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020918.At8pfay4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020918.At8pfay4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/ccp/hygon/tdm-kernel-guard.c:15:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2242:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for function 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         | ^
         | static 
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for function 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for function 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         | ^
         | static 
   4 warnings generated.


vim +/kprobe_symbol_address_byname +243 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

   211	
 > 212	int tdm_service_exit(struct tdm_security_enhance *data)
   213	{
   214		int ret = 0;
   215		int task_status = 0;
   216	
   217		task_status = psp_startstop_measure_task(data->task_id, data->authcode, false);
   218		if (task_status < 0) {
   219			ret = task_status;
   220			pr_err("task_id %d stop failed with 0x%x\n", data->task_id, ret);
   221			goto end;
   222		}
   223	
   224		// Waiting for the task to end
   225		msleep(40);
   226	
   227		psp_destroy_measure_task(data->task_id, data->authcode);
   228	
   229		kfree(data->authcode);
   230		data->authcode = NULL;
   231		kfree(data->mem_range);
   232		data->mem_range = NULL;
   233	end:
   234		return ret;
   235	}
   236	
   237	#if !IS_BUILTIN(CONFIG_TDM_KERNEL_GUARD)
   238	static int p_tmp_kprobe_handler(struct kprobe *p_ri, struct pt_regs *p_regs)
   239	{
   240		return 0;
   241	}
   242	
 > 243	unsigned long kprobe_symbol_address_byname(const char *name)
   244	{
   245		int p_ret;
   246		struct kprobe p_kprobe;
   247		unsigned long addr = 0;
   248	
   249		memset(&p_kprobe, 0, sizeof(p_kprobe));
   250	
   251		p_kprobe.pre_handler = p_tmp_kprobe_handler;
   252		p_kprobe.symbol_name = name;
   253	
   254		p_ret = register_kprobe(&p_kprobe);
   255		if (p_ret < 0) {
   256			pr_err("register_kprobe error [%d] :(\n", p_ret);
   257			return 0;
   258		}
   259	
   260		addr = (unsigned long)p_kprobe.addr;
   261		unregister_kprobe(&p_kprobe);
   262	
   263		return addr;
   264	}
   265	#endif
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
