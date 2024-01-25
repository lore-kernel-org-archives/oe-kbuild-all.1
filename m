Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444714F5E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706186442; cv=none; b=hnlRvT6HW4uf+JLhGJmG5qESIzUDlnm0Dx2RG6fOmCC4vNmuPoKdhk3tLRY5fdh6s8+znwDzvyo3F7I3STbPeNMb8stwORkxXSIh4UvmGUcsc2flniu9ATCISla5CAoK9DdPf6DPUOrC7x2W8EXE6SiHMGo1w0fyhRSJm2MLPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706186442; c=relaxed/simple;
	bh=s72fcAp7BDwIYXjXdsJX2UsMT4lJq4vFxBGoY8wXlJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/tTPSYjR6d++ntjc4Za0FFa6r83N9pUabYpTotFoFZtTI2vd5kCIX6TWqqMHR0a93VR+TkGJ835orC5gAfBzvpVzSouJF4aG5jj9amb055t/yp6Hxsfr1rsHTdBisbXFjcVVPADfUSygLejW/CPAgpHofMHnNHVWoqhJpSDhO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2zAc0gg; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2zAc0gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706186441; x=1737722441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s72fcAp7BDwIYXjXdsJX2UsMT4lJq4vFxBGoY8wXlJE=;
  b=e2zAc0ggUspQslMw82KWqXVA76bSaTGWFGcn+U9JJ0K/Ai0hXVofpvB/
   31e72zq1yTZBcMnIsbeblU4j/kMVCo+NYtwTzi8yRv+TLVYFArIuG1qvo
   uF7kIj+uJOHaX72QyWBpTIgohnK+DdYIXCQu/Lqxe46I2gY0VGxd3RpBG
   S/bRmxjTUTq5onSukVJ9FJjwoqtblByrOlOuXwtxZktUo+//uvx6tgxPA
   2RPB7BGJ3MWgMJHpB8waYoTlDgbaTgqcSgOE+kRy01dji8ascfnlHAocy
   pNGmreEIa2j+BbOlNhroDFKOo4hj2uvAZ+dXyl1GwGvLObcm9mPljDTS0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399311768"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="399311768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:40:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2402505"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2024 04:40:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSz20-0008yh-27;
	Thu, 25 Jan 2024 12:40:32 +0000
Date: Thu, 25 Jan 2024 20:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 157/175]
 arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for
 'hyp_trace_init_event_early'
Message-ID: <202401252039.ubBlU78n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   faf8e92b3bdd8457b68cf85e37cdcd4a4ed867e9
commit: c000ecee29196ed7412f2bdef7a35c7f8e2df5b5 [157/175] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240125/202401252039.ubBlU78n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401252039.ubBlU78n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252039.ubBlU78n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     134 | bool hyp_trace_init_event_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:169:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:199:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     199 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:212:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     212 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/hyp_trace_init_event_early +134 arch/arm64/kvm/hyp_events.c

   133	
 > 134	bool hyp_trace_init_event_early(void)
   135	{
   136		char *token, *buf = early_events;
   137		bool enabled = false;
   138	
   139		while (true) {
   140			token = strsep(&buf, ",");
   141	
   142			if (!token)
   143				break;
   144	
   145			if (*token) {
   146				struct hyp_event *event;
   147				int ret;
   148	
   149				event = find_hyp_event(token);
   150				if (event) {
   151					ret = enable_hyp_event(event, true);
   152					if (ret)
   153						pr_warn("Couldn't enable hyp event %s:%d\n",
   154							token, ret);
   155					else
   156						enabled = true;
   157				} else {
   158					pr_warn("Couldn't find hyp event %s\n", token);
   159				}
   160			}
   161	
   162			if (buf)
   163				*(buf - 1) = ',';
   164		}
   165	
   166		return enabled;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
