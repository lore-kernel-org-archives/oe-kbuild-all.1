Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349F539D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677247977; x=1708783977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fp4tA+iUltAlnGLma9o8GDd9EzYWAtujwIKXsR/KuG8=;
  b=FrIcNNCi04su+TcnW8MYdcroByhZ3Drh8Jxod54Rw27nicgueCxoNZop
   9A9cvf3K/Ax1dhiKB4jyVyVU1d81oX2LR+cC8oNFo57m8kVkkERhQk0nk
   HL4+HOJNUF6hUFJEruMpaml3TASlP19kntyC5dUK2smH4zy33L6KgpxeH
   CFKPA3AJgcpVzehnSNHO7lENnzC0SiEP0r4CsRpmeTRyBUkJ+I/n0oacr
   /TwskYqsjWES4i1UWkEIKs8qh9yn1bA5q2lUVdZDx10vrQXMou5d9ayDs
   ZkOTUZfVtHULou40wtAltxKpLREedOuAimJ6VKp89J3woJX137oCN4sL9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331218421"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="331218421"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 06:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736810634"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="736810634"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2023 06:12:53 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVYoe-0002Sf-1Q;
	Fri, 24 Feb 2023 14:12:52 +0000
Date: Fri, 24 Feb 2023 22:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: drivers/nvme/host/core.c:3109:44: sparse: sparse: invalid
 assignment: &=
Message-ID: <202302242222.PevBhzvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: baff6491448b487e920faaa117e432989cbafa89 nvme: mask CSE effects for security receive
date:   3 weeks ago
config: m68k-randconfig-s051-20230222 (https://download.01.org/0day-ci/archive/20230224/202302242222.PevBhzvC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baff6491448b487e920faaa117e432989cbafa89
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout baff6491448b487e920faaa117e432989cbafa89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302242222.PevBhzvC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/core.c:3109:44: sparse: sparse: invalid assignment: &=
>> drivers/nvme/host/core.c:3109:44: sparse:    left side has type restricted __le32
>> drivers/nvme/host/core.c:3109:44: sparse:    right side has type int

vim +3109 drivers/nvme/host/core.c

  3083	
  3084	static void nvme_init_known_nvm_effects(struct nvme_ctrl *ctrl)
  3085	{
  3086		struct nvme_effects_log	*log = ctrl->effects;
  3087	
  3088		log->acs[nvme_admin_format_nvm] |= cpu_to_le32(NVME_CMD_EFFECTS_LBCC |
  3089							NVME_CMD_EFFECTS_NCC |
  3090							NVME_CMD_EFFECTS_CSE_MASK);
  3091		log->acs[nvme_admin_sanitize_nvm] |= cpu_to_le32(NVME_CMD_EFFECTS_LBCC |
  3092							NVME_CMD_EFFECTS_CSE_MASK);
  3093	
  3094		/*
  3095		 * The spec says the result of a security receive command depends on
  3096		 * the previous security send command. As such, many vendors log this
  3097		 * command as one to submitted only when no other commands to the same
  3098		 * namespace are outstanding. The intention is to tell the host to
  3099		 * prevent mixing security send and receive.
  3100		 *
  3101		 * This driver can only enforce such exclusive access against IO
  3102		 * queues, though. We are not readily able to enforce such a rule for
  3103		 * two commands to the admin queue, which is the only queue that
  3104		 * matters for this command.
  3105		 *
  3106		 * Rather than blindly freezing the IO queues for this effect that
  3107		 * doesn't even apply to IO, mask it off.
  3108		 */
> 3109		log->acs[nvme_admin_security_recv] &= ~NVME_CMD_EFFECTS_CSE_MASK;
  3110	
  3111		log->iocs[nvme_cmd_write] |= cpu_to_le32(NVME_CMD_EFFECTS_LBCC);
  3112		log->iocs[nvme_cmd_write_zeroes] |= cpu_to_le32(NVME_CMD_EFFECTS_LBCC);
  3113		log->iocs[nvme_cmd_write_uncor] |= cpu_to_le32(NVME_CMD_EFFECTS_LBCC);
  3114	}
  3115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
