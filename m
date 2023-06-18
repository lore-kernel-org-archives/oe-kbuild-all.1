Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30F15CE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687089917; x=1718625917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1az2WTOh675GT7p+QwY5GYMSg4XT7/ZvJYAqhFhfhV8=;
  b=l1oRi7xcJs10Bnu9wBYofO+Y9fpRY7kLR0Rlk6c+gMmMAWxI0wI1HfnT
   0iyzhLbSx3eG/RSkhNG8yP4wH47iHMKxnX5OFbhFRK9Va0dK8viC2rzy3
   YHkUnibI9FvLYgghcNU4aEqUsufNtkDpzjatBYWKTAJqPIlFPJbvF4bz4
   tOqcGq48JmJ0qeykzYVgEcT6BgcVyHAEePaq/89tMNWGFmPaHseKJJauW
   t5PTwir2TPwD0PJsA+uflGugLYdnRC/0XrOX5fziU8bwmhR7qGOoFmasN
   wOqtKANcvAn4cirF1du9ybI9+zYzNaZHSueUKixPqRqhfd54co45/NgaP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="344214802"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="344214802"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 05:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="826290390"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="826290390"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2023 05:05:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAr9f-0003h0-0J;
	Sun, 18 Jun 2023 12:05:15 +0000
Date: Sun, 18 Jun 2023 20:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230618-hacks 13/45] fops.c:undefined
 reference to `iomap_file_buffered_write'
Message-ID: <202306182057.wMnKqTtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks
head:   d17988fe31ebdd87d8d375a54d9e94ac79252b03
commit: 3bda730e3543cbce9a2da5a6bae492e592322905 [13/45] block: use iomap for writes to block devices
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230618/202306182057.wMnKqTtB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306182057.wMnKqTtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306182057.wMnKqTtB-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: block/fops.o: in function `blkdev_write_iter':
>> fops.c:(.text+0x15b4): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x15b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'
>> or1k-linux-ld: fops.c:(.text+0x16cc): undefined reference to `iomap_file_buffered_write'
   fops.c:(.text+0x16cc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `iomap_file_buffered_write'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
