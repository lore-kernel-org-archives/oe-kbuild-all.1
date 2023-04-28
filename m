Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82B20E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682662586; x=1714198586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sfL9oKdMGiqAv8zuZWM1sYcfhkWY/sjDNL9L6OdNe28=;
  b=BmnPGtAmW9hxTPiprK2JaIJCrxg8rYh4fPTlZNBLyfiGgZ/R2Ta4vJuC
   jJ0LPo6IpUv69P+7i8R9x74OUteL4wszmCcNIHspYzizPZXvqk/CcSjzO
   oK3DYY54bbAKeb/XHgLTmsk109dD/lZTqLSzkGq37K5yZshlNPIzRFWW5
   eVlMNmupDg7u/EOeuzEddUaXa52Mhg0Gnzlw8mV/cCuYxAodnNeCdqdPk
   14zAfZyuCDQZRvOIaYtiR3AylhmZCBiH6lpEZs43zS06ryIm+lu9OtPFr
   lP82xFn93YtTVlGYeb8cbz1qQ3ivMNOi0/5HICJVUhfPCNSZFtd6LDTTd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331963740"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="331963740"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 23:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="672037937"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="672037937"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 23:16:22 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psHP3-0000C1-0k;
	Fri, 28 Apr 2023 06:16:21 +0000
Date: Fri, 28 Apr 2023 14:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Daejun Park <daejun7.park@samsung.com>,
	"jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"chao@kernel.org" <chao@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seokhwan Kim <sukka.kim@samsung.com>,
	Yonggil Song <yonggil.song@samsung.com>,
	beomsu kim <beomsu7.kim@samsung.com>,
	Daejun Park <daejun7.park@samsung.com>
Subject: Re: [PATCH v3] f2fs: add async reset zone command support
Message-ID: <202304281424.WrTeoZ4B-lkp@intel.com>
References: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a@epcms2p3>

Hi Daejun,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev linus/master next-20230427]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daejun-Park/f2fs-add-async-reset-zone-command-support/20230428-105944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230428025646epcms2p35acbea45ee80d36808861edba8a3c84a%40epcms2p3
patch subject: [PATCH v3] f2fs: add async reset zone command support
config: microblaze-randconfig-r024-20230427 (https://download.01.org/0day-ci/archive/20230428/202304281424.WrTeoZ4B-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daejun-Park/f2fs-add-async-reset-zone-command-support/20230428-105944
        git checkout 2f3e641e3de509a5ed879fb10fdf3377fd9ca0d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash fs/f2fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281424.WrTeoZ4B-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/segment.c: In function 'f2fs_wait_discard_bio':
>> fs/f2fs/segment.c:1789:33: error: implicit declaration of function '__submit_zone_reset_cmd' [-Werror=implicit-function-declaration]
    1789 |                                 __submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__submit_zone_reset_cmd +1789 fs/f2fs/segment.c

  1775	
  1776	/* This should be covered by global mutex, &sit_i->sentry_lock */
  1777	static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
  1778	{
  1779		struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
  1780		struct discard_cmd *dc;
  1781		bool need_wait = false;
  1782	
  1783		mutex_lock(&dcc->cmd_lock);
  1784		dc = __lookup_discard_cmd(sbi, blkaddr);
  1785		if (dc) {
  1786			if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
  1787				/* force submit zone reset */
  1788				if (dc->state == D_PREP)
> 1789					__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
  1790								&dcc->wait_list, NULL);
  1791				dc->ref++;
  1792				need_wait = true;
  1793			} else {
  1794				if (dc->state == D_PREP) {
  1795					__punch_discard_cmd(sbi, dc, blkaddr);
  1796				} else {
  1797					dc->ref++;
  1798					need_wait = true;
  1799				}
  1800			}
  1801		}
  1802		mutex_unlock(&dcc->cmd_lock);
  1803	
  1804		if (need_wait)
  1805			__wait_one_discard_bio(sbi, dc);
  1806	}
  1807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
