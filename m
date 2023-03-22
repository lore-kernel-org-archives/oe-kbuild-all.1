Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B523B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679477134; x=1711013134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfhrp8iPSQmV2bVU3KHGZ0M/NIJCkOCiaD6roS2eIAk=;
  b=BBMwYqwEvR4vw7F/g/PSr+9j8KfiObRdQtfD7r2XpKhAGnC3M6Cn9mcH
   saVpqRvHLK/2LOjH/WXd7HaI5JC2GHuurjPmm0LS2DSvm3MLAChNQmZjl
   q28qpNssWiLznaBltsz0tKgzPXM/Qtq2XasADRO7RXEJz5BV/oPIpBYp4
   W7CiADYjMwI9tivFFeyJP7BrvQlm08zKnphvQ6WwTU8GkfP1UubsppgiT
   nSRMQC+tx0lKAhECoJRReMASN3qqsQLnMep9XqsfDmY7f33jqm7KMVr6O
   bXIkzifXGz0I1GZnviUAg7t2i7/ThtSPWccLFVj0HIJ3s4NEWhj4uKaWf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319560124"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="319560124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 02:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684235029"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="684235029"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 02:25:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peuio-000D83-29;
	Wed, 22 Mar 2023 09:25:30 +0000
Date: Wed, 22 Mar 2023 17:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
	axboe@kernel.dk, linux-nvme@lists.infradead.org, hch@lst.de,
	sagi@grimberg.me
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 1/3] nvme-fabrics: add queue setup helpers
Message-ID: <202303221736.jlRVazVR-lkp@intel.com>
References: <20230322002350.4038048-2-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322002350.4038048-2-kbusch@meta.com>

Hi Keith,

I love your patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/nvme-fabrics-add-queue-setup-helpers/20230322-082537
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230322002350.4038048-2-kbusch%40meta.com
patch subject: [PATCH 1/3] nvme-fabrics: add queue setup helpers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230322/202303221736.jlRVazVR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0acb3964621b925db18ebec1a6c57bc3c3446859
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keith-Busch/nvme-fabrics-add-queue-setup-helpers/20230322-082537
        git checkout 0acb3964621b925db18ebec1a6c57bc3c3446859
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221736.jlRVazVR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "blk_mq_rdma_map_queues" [drivers/nvme/host/nvme-fabrics.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
