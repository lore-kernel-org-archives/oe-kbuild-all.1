Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87D12F5A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711544958; cv=none; b=ENY6MHTAqa2dnIE3StLi51c2MTyDQuYzW97rx/Vp/NkGPJ4FAgCfdDgUPBKK/i3gYPQ+NXkm1LFLboxkztvs6ENJNqTu3NYyk3mAJU2Qu3NQ6xSN8iqcyTjUdsPxY+3IiifL5tXvF6NZVerYMwcsxnXs6R01ZbBvFKFVS0qYsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711544958; c=relaxed/simple;
	bh=Trki3eD1i9gJpV+lfj9mSu6+2HaoF0l0wKjTLLICYck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAA9hwxKFTvxLhaZAqjfqergxIdoovvAZ9Yv+0FRfUdQGAASUdV5TQ3JYsWX9CihhePi8fRGmpl7DSkYldBnjmrHiUylqEg1ECF95+rKCweBv+2/Gzd6rj5HSmqpYRSTO94x3A7ENqOKIejltzMVSzxODGl9iYG70t8sLh0sOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVB4p09H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVB4p09H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711544957; x=1743080957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Trki3eD1i9gJpV+lfj9mSu6+2HaoF0l0wKjTLLICYck=;
  b=nVB4p09Hx09Y+FCKgpHbuKocT9XIDFnDS20z9HKBBVh2IkPJjvDbO+jh
   NXty1kfkrVDM8ExjS3qly4tXXJ/qmYj7wmeBZc890W8vkXx9pV6BjzheR
   t4BZDxwJAGQw2/WPm7ss5fpTNveMlyM+GLCL/hMOztkryvknHu/9HSp9v
   Vy+7XyEtzfYx9rrhOQb10QmrSZ8VQsLvTY4vpwVbUX75CZFQEDFA/D7p+
   b35Ye+SuSRzHnIQdciHh6X4wL2e8YKH/JAU8vaM10hyJKkAxqds/OZGoo
   QRlgrcvxz7zuKr/LJ+1Bxu20yx+F/YifqF726dRXZH9HFyLephUyJa6lj
   w==;
X-CSE-ConnectionGUID: e3shl6JiTaSC4Fg9z0VoAA==
X-CSE-MsgGUID: nQf360MmQNe6ih3KNE9swA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6580775"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6580775"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 06:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914912935"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="914912935"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 06:09:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rpT1j-0000000GdhP-4At0;
	Wed, 27 Mar 2024 15:09:11 +0200
Date: Wed, 27 Mar 2024 15:09:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re: [broonie-ci:fileECoqy0 5/6]
 sound/soc/generic/simple-card-utils.c:755:20: error: 'struct
 snd_soc_jack_gpio' has no member named 'gpio'
Message-ID: <ZgQad95fT5rqAFZe@smile.fi.intel.com>
References: <202403270859.Ew6NATlW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403270859.Ew6NATlW-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 27, 2024 at 09:01:01AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileECoqy0
> head:   3c398a2eb9081a10c34a40701159a34319a35f19
> commit: c81737adb6536b26ebf9176179b3551cb33be4c0 [5/6] ASoC: soc-jack: Get rid of legacy GPIO support
> config: i386-buildonly-randconfig-003-20240325 (https://download.01.org/0day-ci/archive/20240327/202403270859.Ew6NATlW-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270859.Ew6NATlW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403270859.Ew6NATlW-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Already fixed.

-- 
With Best Regards,
Andy Shevchenko


