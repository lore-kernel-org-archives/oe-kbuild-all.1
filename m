Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037A6AB5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681390433; x=1712926433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cf9nlwl8d3niwKx0D4zeoXeEDtv7hftLRRYw4QHd3Cw=;
  b=YKq2xVt0sAui03CT8ZvQYCaP7SyBCUiyiJTrs4kLUgDrhG+3yF+v++Lh
   8UUii21S2Nn9JZ2l78GB1q9iT0BZcP4DOaJNOHrhlEW33J7CZbzIcMAfM
   ya32l7er251KCJ2gLtlaSFuCggGzkKavhITWgwRyRKduRulursgjm17pr
   EmbhjaWyVNCrRBzr9CLJST/iXHArzNqmPHkXxftaU5cQkbOopk2qOsf7z
   WXOo4Q2WTJ5+2bE0s2oI4j4T4IN9LkI4VyBRbwmkbZ9QfvJ1Qgn+lwe26
   zhxLqDHIdrhvqiBWKwq6AIl6mB+iYioBJX3MlMDeHfdeurF7jaFyquzFU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="345965513"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="345965513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 05:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="666777301"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; 
   d="scan'208";a="666777301"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 05:53:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmwST-000Yh7-06;
	Thu, 13 Apr 2023 12:53:49 +0000
Date: Thu, 13 Apr 2023 20:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Li Feng <fengli@smartx.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lifeng1519@gmail.com,
	Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] nvme/tcp: Add support to set the tcp worker cpu affinity
Message-ID: <202304132042.jQcDkblz-lkp@intel.com>
References: <20230413063317.2455680-1-fengli@smartx.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413063317.2455680-1-fengli@smartx.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.3-rc6 next-20230412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Feng/nvme-tcp-Add-support-to-set-the-tcp-worker-cpu-affinity/20230413-143611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230413063317.2455680-1-fengli%40smartx.com
patch subject: [PATCH] nvme/tcp: Add support to set the tcp worker cpu affinity
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230413/202304132042.jQcDkblz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/e5a036c113d5ce43375a6aafedcf705ef8c3acb1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Li-Feng/nvme-tcp-Add-support-to-set-the-tcp-worker-cpu-affinity/20230413-143611
        git checkout e5a036c113d5ce43375a6aafedcf705ef8c3acb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304132042.jQcDkblz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/tcp.c:44:16: sparse: sparse: symbol 'cpu_affinity_mask' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
