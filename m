Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7C107B1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685704829; x=1717240829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ibySYrNNT3IVJib73vqU6Prg/GfysDkIt45VKN1+9iI=;
  b=YoGnxunphxyxgof2mlCzUUbWiPJ6ZrUqAKaquPs6XNN1JRkKFZFGDwD9
   veZgxqd4M6Id9O7/9+xyCrhAaCHfmXLgOIzKie12APlZdvmZDlztE9XiO
   aofkKO435bOX3kzw6ngn8XEBigMNOHTvWzXERUByQIxl/12XdsAGYfHgv
   xXT6gMOwT8YvTGAli4QnT1OJI7qRjLPcReE9TzXRcsiQjqE8EZv3VOkQq
   T0RJIwKYBDmcdZU0ZdkVYEuCoZCEudQXHVwLCsD2S89mq98bmWcxPkPN/
   xW7RvwTw6QKThpsppHJOSHZZhHYZUUCeaY7XTsur1jsFotMTL96j4MvZM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384127857"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="384127857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="685288774"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="685288774"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jun 2023 04:20:26 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q52pV-0000Nl-2C;
	Fri, 02 Jun 2023 11:20:25 +0000
Date: Fri, 2 Jun 2023 19:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, quic_kvalo@quicinc.com,
	ath11k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: add tx delay to TSF
Message-ID: <202306021958.bdB3k531-lkp@intel.com>
References: <1685698250-722-1-git-send-email-quic_haric@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1685698250-722-1-git-send-email-quic_haric@quicinc.com>

Hi Hari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on next-20230602]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Chandrakanthan/wifi-ath11k-add-tx-delay-to-TSF/20230602-173351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/1685698250-722-1-git-send-email-quic_haric%40quicinc.com
patch subject: [PATCH] wifi: ath11k: add tx delay to TSF
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306021958.bdB3k531-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/493e1ad70fff68a5c06b59683ebd453dafcafd19
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hari-Chandrakanthan/wifi-ath11k-add-tx-delay-to-TSF/20230602-173351
        git checkout 493e1ad70fff68a5c06b59683ebd453dafcafd19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021958.bdB3k531-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/wmi.c:8609:6: warning: no previous prototype for 'ath11k_wmi_event_tbttoffset_update' [-Wmissing-prototypes]
    8609 | void ath11k_wmi_event_tbttoffset_update(struct ath11k_base *ab, struct sk_buff *skb)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ath11k_wmi_event_tbttoffset_update +8609 drivers/net/wireless/ath/ath11k/wmi.c

  8608	
> 8609	void ath11k_wmi_event_tbttoffset_update(struct ath11k_base *ab, struct sk_buff *skb)
  8610	{
  8611		struct wmi_tbtt_offset_info tbtt_offset_info;
  8612		int ret;
  8613	
  8614		ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
  8615					  ath11k_wmi_tbtt_offset_event_parser,
  8616					  &tbtt_offset_info);
  8617		if (ret) {
  8618			ath11k_warn(ab, "failed to parse tbtt tlv %d\n", ret);
  8619		}
  8620	}
  8621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
