Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142B93FB2D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 20:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyivWLEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696884708; x=1728420708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JS89xiOwVpMYKWfibYIVoPLZXuioTFFMh8StJJZxw4s=;
  b=hyivWLEBdOmXG+7XzUoaoNjG3ijNeQ2a5e7I06T75wdil3cBaJnAJuSf
   4EzG3dTJ2t0deKBxVIGGTVWNCOZqFhE/llWidd7XxVZHYZYwgxvTllWTA
   Wid3An+EyFQ4vEz5ZRKln7+Xftz8jq8Zue8FFIPFLp05TFurQDo8INq9R
   +8xif33+bfsYMuP/7WUfBHWuuyZZZAzWxVhNmmz2e0K43GKCSLZbrQx8z
   UFtk7JpWYDpaeBHsjl/g8jLKrIwHKokZPH3XMdePswjp3ddahmLdmfvQk
   aO8+xEWgHdowIj+adpqNgw4dr8fTgwe5sWsvLrsBLp8CiVAFgBsSpTSrZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448438452"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="448438452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 13:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="729815818"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="729815818"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Oct 2023 13:51:46 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpxE7-0000fA-2T;
	Mon, 09 Oct 2023 20:51:43 +0000
Date: Tue, 10 Oct 2023 04:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2434/30000]
 drivers/cpufreq/cpufreq_times.c:629:37: warning:
 'concurrent_policy_time_fops' defined but not used
Message-ID: <202310100455.vCKBBRZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   5759bbcc0d24a0f84f9021cf06f02a08c4e739fe
commit: e326ab09990544bbb1a59571995e272e7755e4b3 [2434/30000] ANDROID: cpufreq: times: add /proc/uid_concurrent_{active,policy}_time
config: arm-randconfig-004-20231010 (https://download.01.org/0day-ci/archive/20231010/202310100455.vCKBBRZk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100455.vCKBBRZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100455.vCKBBRZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/cpufreq_times.c:629:37: warning: 'concurrent_policy_time_fops' defined but not used [-Wunused-const-variable=]
     629 | static const struct file_operations concurrent_policy_time_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/cpufreq_times.c:610:37: warning: 'concurrent_active_time_fops' defined but not used [-Wunused-const-variable=]
     610 | static const struct file_operations concurrent_active_time_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/cpufreq_times.c:591:37: warning: 'uid_time_in_state_fops' defined but not used [-Wunused-const-variable=]
     591 | static const struct file_operations uid_time_in_state_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~


vim +/concurrent_policy_time_fops +629 drivers/cpufreq/cpufreq_times.c

   609	
 > 610	static const struct file_operations concurrent_active_time_fops = {
   611		.open		= concurrent_active_time_open,
   612		.read		= seq_read,
   613		.llseek		= seq_lseek,
   614		.release	= seq_release,
   615	};
   616	
   617	static const struct seq_operations concurrent_policy_time_seq_ops = {
   618		.start = uid_seq_start,
   619		.next = uid_seq_next,
   620		.stop = uid_seq_stop,
   621		.show = concurrent_policy_time_seq_show,
   622	};
   623	
   624	static int concurrent_policy_time_open(struct inode *inode, struct file *file)
   625	{
   626		return seq_open(file, &concurrent_policy_time_seq_ops);
   627	}
   628	
 > 629	static const struct file_operations concurrent_policy_time_fops = {
   630		.open		= concurrent_policy_time_open,
   631		.read		= seq_read,
   632		.llseek		= seq_lseek,
   633		.release	= seq_release,
   634	};
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
