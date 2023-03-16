Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B67AD32
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678999508; x=1710535508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mJ+qKyfpyJVasv0eyMrzoJcLhUSSHKFUhtEDdccY7tc=;
  b=CVJjcE2kKQTZHQxwmni8r4uABO8i/T9ERMiVyzbWe6orprFClOTclQ4l
   jmmG6eWY1pbmQe8BuPcyYL2HoHaljzTyz5S6znPwt55OYXzpXXbJPfYQA
   Rczh1NwKtd3L3QzEqwcl+laprfL5fXFVi52HfGAiMubM0Np3qqrqr7+w+
   4jN9u8Gj7qzimmoMvhuF1NAGm4hZUmjma1qh00LX8esF2FS4W7bLuipAy
   FwgR3B+FjZkktqs+2E6Uj/II54n/Y+Yfj744OJLxQLVjRb3EvBLtj+Psu
   9kTYG+2S+6y4DYvCEJlyqJJbWOnvLJoiRCAQzxMr9MZ39EFZJiQ3uxiAl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="365805110"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="365805110"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 13:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009391609"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="1009391609"
Received: from rljames-mobl1.amr.corp.intel.com (HELO [10.255.38.195]) ([10.255.38.195])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 13:45:07 -0700
Message-ID: <a6c6bf49-3444-34c6-9063-caeeb983f8c2@linux.intel.com>
Date: Thu, 16 Mar 2023 15:45:06 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [plbossart-sound:hdaudio/extended-multi-link 37/55] htmldocs:
 Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Explicit markup
 ends without a blank line; unexpected unindent.
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202303170328.2q2okF5F-lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <202303170328.2q2okF5F-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fixed with https://github.com/thesofproject/linux/pull/4255

Thanks LKP team!

On 3/16/23 14:54, kernel test robot wrote:
> tree:   https://github.com/plbossart/sound hdaudio/extended-multi-link
> head:   f423930a1ce99bb84fac6fa397fc486113748ab0
> commit: 979b29edbe5828b53d007f27e08b65515b4aa961 [37/55] Documentation: sound: add description of Intel HDaudio multi-links
> reproduce:
>         # https://github.com/plbossart/sound/commit/979b29edbe5828b53d007f27e08b65515b4aa961
>         git remote add plbossart-sound https://github.com/plbossart/sound
>         git fetch --no-tags plbossart-sound hdaudio/extended-multi-link
>         git checkout 979b29edbe5828b53d007f27e08b65515b4aa961
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303170328.2q2okF5F-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>>> Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Undefined substitution referenced: "copy".
> 
> vim +2 Documentation/sound/hd-audio/intel-multi-link.rst
> 
>    > 2	:Copyright: |copy| 2023 Intel Corporation
>      3	
> 
