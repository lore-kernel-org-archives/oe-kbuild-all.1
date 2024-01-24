Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F263C3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706092324; cv=none; b=VeuTNXzsKFqDL0dqnhM3AwaQBMCxNBm5x9LmMdqjgWdLWMwAxcOFg70zqGHTrpRoZqtWfHupe+/M3lznKYjTdvFTgzvqxJb1eCa+uY+127YwfBjsM7eKfrQsBfXB5WP0TP6u9sTp/J8exGgvFY5KOmXZ86qAjKP4KjcpXPhnmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706092324; c=relaxed/simple;
	bh=PRreogJJku2cdQywmx5EKPtF1IU7sg2jEJDp9cRsXcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJTvRnMJ/OEfS8H20P2Xfu/gBaROkCl1ISEkQBmjnfoRgusAywKh+XhwSbLgovfKSAP8Eidrq/eJpg8UhoiPmYng84Y6JyF7X9xz3L58uThinMXUHdG3897XsI78ThNaTJquMwT4fyZ5VfiaBQHX4Gr6T87+u87TQ2rDEaz+SGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cR8gFxx5; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cR8gFxx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706092322; x=1737628322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRreogJJku2cdQywmx5EKPtF1IU7sg2jEJDp9cRsXcg=;
  b=cR8gFxx53aIWycRDCJkhmw9CSQ6bsndMPHWmpGC5m1CQPfnCo6euWkKY
   2NkNFdwlEKjjfTDaQAbzBzTD2tbrbS4vByafC7OifyYQe8d+Rjh6uDHPD
   QlL9aVAjz5NQMMbrTS1IIqIuQuXknTqYrxKbnHfOn1YqLqOloXsEAma5t
   bd4VTICnJUvLfl+4lwQHo+/thhSnh3SKA/8jo5ggr3TGbJ7rUIJTW3gQb
   PnFIHe4KiuQlugt3cSp49Q2RMQLrCscwP08kGo2YOhB6XIIB35i0kivFr
   0N1Yw0s5IACBXSyBBLGS1DhPnEC5geolJU2TbisOl13oEqar0IArXhZAX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401465840"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401465840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735889372"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="735889372"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2024 02:31:59 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSaY1-00083v-1P;
	Wed, 24 Jan 2024 10:31:57 +0000
Date: Wed, 24 Jan 2024 18:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 154/175]
 arch/arm64/kvm/hyp_trace.c:702:66: warning: '%ld' directive output may be
 truncated writing between 1 and 20 bytes into a region of size 13
Message-ID: <202401241831.A5CoWPdM-lkp@intel.com>
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
commit: c24ca55000da3492aacf4e383634f060faeb5050 [154/175] ANDROID: KVM: arm64: Add nVHE hyp tracing to tracefs
config: arm64-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240124/202401241831.A5CoWPdM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241831.A5CoWPdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241831.A5CoWPdM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
>> arch/arm64/kvm/hyp_trace.c:702:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:702:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:702:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     702 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +702 arch/arm64/kvm/hyp_trace.c

   665	
   666	int hyp_trace_init_tracefs(void)
   667	{
   668		struct dentry *root, *per_cpu_root;
   669		char per_cpu_name[16];
   670		long cpu;
   671	
   672		if (!is_protected_kvm_enabled())
   673			return 0;
   674	
   675		root = tracefs_create_dir(TRACEFS_DIR, NULL);
   676		if (!root) {
   677			pr_err("Failed to create tracefs "TRACEFS_DIR"/\n");
   678			return -ENODEV;
   679		}
   680	
   681		tracefs_create_file("tracing_on", TRACEFS_MODE_WRITE, root, NULL,
   682				    &hyp_tracing_on_fops);
   683	
   684		tracefs_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, root, NULL,
   685				    &hyp_buffer_size_fops);
   686	
   687		tracefs_create_file("trace", TRACEFS_MODE_WRITE, root,
   688				    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_fops);
   689	
   690		tracefs_create_file("trace_pipe", TRACEFS_MODE_WRITE, root,
   691				    (void *)RING_BUFFER_ALL_CPUS, &hyp_trace_pipe_fops);
   692	
   693		per_cpu_root = tracefs_create_dir("per_cpu", root);
   694		if (!per_cpu_root) {
   695			pr_err("Failed to create tracefs folder "TRACEFS_DIR"/per_cpu/\n");
   696			return -ENODEV;
   697		}
   698	
   699		for_each_possible_cpu(cpu) {
   700			struct dentry *per_cpu_dir;
   701	
 > 702			snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
