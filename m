Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB641DFDF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTqUcIg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698766415; x=1730302415;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/rS7iLIs9VDuh9c2JhT/yQocJgm3+S64byTGkvfVmZE=;
  b=HTqUcIg3iqn50f4uJOgftfY8gHcippuqRAOj1HdmMUqbiYIij+PA04g5
   WLgb3kDOY/5PL6EabG25oHIiGQR2Jo5WsBRZtO7jg77an2U4nRaBI/5wQ
   IXY40wB9LpG8LDW4kLTarQOE/bkdVy13pohgJJL+Yn2kP2uIgLseFZtnm
   UO6C7j7pgfyrmQq3SP9NUkLTr3zh8+mMLnVPNZGWVJMENydjmtQv6ObRF
   Ex3a+V0rOxctFyPwlOcrrVPIB2AW1OvtKJxQgYxlGBkZ66bOHh7+j6FME
   D0PJ1SZCfqpm2z38TIlCFp00LWN/ZCtAcCEAmRxMx8OcY8xZUIIGWsJmb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="9841227"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="9841227"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 08:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="764285767"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="764285767"
Received: from egomarna-mobl1.amr.corp.intel.com (HELO [10.255.229.105]) ([10.255.229.105])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 08:33:32 -0700
Message-ID: <43f7f4ef-d2cc-4a39-b301-8999d68469e6@linux.intel.com>
Date: Tue, 31 Oct 2023 10:33:31 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [plbossart-sound:sdw/add-rw-debugfs-support 21/26]
 sound/pci/hda/patch_hdmi.c:4648:6: error: redefinition of
 'snd_hda_device_is_hdmi'
To: kernel test robot <lkp@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202310311348.zvHI24jb-lkp@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202310311348.zvHI24jb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fixed by update

31685a688828f050151df97f411e29d8f8bf4e3e
fixup! ALSA: hda/hdmi: Add helper function to check if a device is HDMI
codec

On 10/31/23 00:27, kernel test robot wrote:
> tree:   https://github.com/plbossart/sound sdw/add-rw-debugfs-support
> head:   2c350273f5f3b3f47df642297fbcd83e7216613e
> commit: 5762a2e74908f4cbb7955140b0175539171aaee1 [21/26] ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
> config: arc-randconfig-002-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311348.zvHI24jb-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311348.zvHI24jb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310311348.zvHI24jb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/pci/hda/patch_hdmi.c:4648:6: error: redefinition of 'snd_hda_device_is_hdmi'
>     4648 | bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from sound/pci/hda/patch_hdmi.c:29:
>    include/sound/hdaudio.h:165:20: note: previous definition of 'snd_hda_device_is_hdmi' with type 'bool(struct hdac_device *)' {aka '_Bool(struct hdac_device *)'}
>      165 | static inline bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/snd_hda_device_is_hdmi +4648 sound/pci/hda/patch_hdmi.c
> 
>   4647	
>> 4648	bool snd_hda_device_is_hdmi(struct hdac_device *hdev)
>   4649	{
>   4650		int i;
>   4651	
>   4652		for (i = 0; i < ARRAY_SIZE(snd_hda_id_hdmi); i++) {
>   4653			if (snd_hda_id_hdmi[i].vendor_id == hdev->vendor_id)
>   4654				return true;
>   4655		}
>   4656	
>   4657		return false;
>   4658	}
>   4659	EXPORT_SYMBOL_GPL(snd_hda_device_is_hdmi);
>   4660	
> 
