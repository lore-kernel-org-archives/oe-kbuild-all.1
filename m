Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F202BE7B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496479; cv=none; b=Pg7TwVUIm9OozI6um0/RtXqwgm3b4Iu0G9/Q6+8wfebb2fLyhD5dwfhS8/VPq5nCYgJfNEI0MQhoiL6ngQ7T/UK6ZxTvEA487xhAsBN9TH3pRu7ymSptcdhWMcHkgF8pg+Wiyc8kMOrB778aPA3884eMe+TVyXPya0WEVYps0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496479; c=relaxed/simple;
	bh=rzoEv/oiH+IKBC26au6kXDl4IIS9rQEhwfcvPjRwjxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+Xw3dJm33iamDlTiPi+usb5HFOjMDr3geCWFIf1IBlpH1oEMGjZ4d6bU9aaLTSliA4rsyotd1mKlSzajfjuwnAcMIC859BUgG902X2egCft7sy9uEKUeSh54KagzXUuulQ5SVP+E4vQLcdM+YOmHh1u6E/ZA3gJpeqf8MUuwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9BgMl7i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9BgMl7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757496478; x=1789032478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rzoEv/oiH+IKBC26au6kXDl4IIS9rQEhwfcvPjRwjxo=;
  b=c9BgMl7iCIyGZ5ylaq4VO153mDNEZP5A+MAOjW/AbXfdO6wIcdHA1iSn
   CaLj9poI1A3aMaCSJwRIhYiXCa88jHPV7XVZb3j8dS2j76oNfu4MsDgD7
   iJ8UxYbdFRHH3ib10gGI6gqBAmZCsltAGobrn531d8fKXV3seEjX2adnT
   PZHO1ldKQeurrFNpTUwrdF9yrhqza9UZPjcmhr9T8pxMUO4yn41SAbURP
   //Yk5+dKgPaSCvG9eJLbjUCes+SA65IHFyk7D9ZwhVFcjPsUSgnu5H2sW
   DCJppqSHklo8oSTOGD+qQOC1gFiVmOGgkog0mS/4ky7btBngRVuiaC+uh
   g==;
X-CSE-ConnectionGUID: cyMQjG8QQ5ug00ZjiwWIog==
X-CSE-MsgGUID: R9P8BYFGRMWh9/xWWsVuRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59494337"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="59494337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 02:27:57 -0700
X-CSE-ConnectionGUID: hViZG+EJRcq7nGeq7qSSUg==
X-CSE-MsgGUID: UeXm/vkQTy+X6X8yBwO+pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="174132360"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2025 02:27:56 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwH7J-0005kp-2u;
	Wed, 10 Sep 2025 09:27:53 +0000
Date: Wed, 10 Sep 2025 17:27:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC wireless-next 1/3] wifi: cfg80211: correctly implement and
 validate S1G chandef
Message-ID: <202509101724.25F6pV0x-lkp@intel.com>
References: <20250909080758.1004956-2-lachlan.hodges@morsemicro.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909080758.1004956-2-lachlan.hodges@morsemicro.com>

Hi Lachlan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on next-20250909]
[cannot apply to wireless/main linus/master v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lachlan-Hodges/wifi-cfg80211-correctly-implement-and-validate-S1G-chandef/20250909-161105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250909080758.1004956-2-lachlan.hodges%40morsemicro.com
patch subject: [RFC wireless-next 1/3] wifi: cfg80211: correctly implement and validate S1G chandef
config: arm-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101724.25F6pV0x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101724.25F6pV0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101724.25F6pV0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/wireless/chan.c: In function 'cfg80211_chandef_valid':
>> net/wireless/chan.c:370:3: error: a label can only be part of a statement and a declaration is not a statement
      u32 control_khz, start_khz, end_khz;
      ^~~


vim +370 net/wireless/chan.c

   341	
   342	bool cfg80211_chandef_valid(const struct cfg80211_chan_def *chandef)
   343	{
   344		u32 control_freq;
   345	
   346		if (!chandef->chan)
   347			return false;
   348	
   349		if (chandef->freq1_offset >= 1000)
   350			return false;
   351	
   352		control_freq = chandef->chan->center_freq;
   353	
   354		switch (chandef->width) {
   355		case NL80211_CHAN_WIDTH_5:
   356		case NL80211_CHAN_WIDTH_10:
   357		case NL80211_CHAN_WIDTH_20:
   358		case NL80211_CHAN_WIDTH_20_NOHT:
   359			if (ieee80211_chandef_to_khz(chandef) !=
   360			    ieee80211_channel_to_khz(chandef->chan))
   361				return false;
   362			if (chandef->center_freq2)
   363				return false;
   364			break;
   365		case NL80211_CHAN_WIDTH_1:
   366		case NL80211_CHAN_WIDTH_2:
   367		case NL80211_CHAN_WIDTH_4:
   368		case NL80211_CHAN_WIDTH_8:
   369		case NL80211_CHAN_WIDTH_16:
 > 370			u32 control_khz, start_khz, end_khz;
   371	
   372			if (!cfg80211_chandef_is_s1g(chandef))
   373				return false;
   374			if (chandef->center_freq2)
   375				return false;
   376	
   377			control_khz = ieee80211_channel_to_khz(chandef->chan);
   378			start_khz = cfg80211_s1g_get_start_freq_khz(chandef);
   379			end_khz = cfg80211_s1g_get_end_freq_khz(chandef);
   380	
   381			if (control_khz < start_khz || control_khz > end_khz)
   382				return false;
   383			break;
   384		case NL80211_CHAN_WIDTH_80P80:
   385			if (!chandef->center_freq2)
   386				return false;
   387			/* adjacent is not allowed -- that's a 160 MHz channel */
   388			if (chandef->center_freq1 - chandef->center_freq2 == 80 ||
   389			    chandef->center_freq2 - chandef->center_freq1 == 80)
   390				return false;
   391			break;
   392		default:
   393			if (chandef->center_freq2)
   394				return false;
   395			break;
   396		}
   397	
   398		switch (chandef->width) {
   399		case NL80211_CHAN_WIDTH_5:
   400		case NL80211_CHAN_WIDTH_10:
   401		case NL80211_CHAN_WIDTH_20:
   402		case NL80211_CHAN_WIDTH_20_NOHT:
   403		case NL80211_CHAN_WIDTH_1:
   404		case NL80211_CHAN_WIDTH_2:
   405		case NL80211_CHAN_WIDTH_4:
   406		case NL80211_CHAN_WIDTH_8:
   407		case NL80211_CHAN_WIDTH_16:
   408			/* all checked above */
   409			break;
   410		case NL80211_CHAN_WIDTH_320:
   411			if (chandef->center_freq1 == control_freq + 150 ||
   412			    chandef->center_freq1 == control_freq + 130 ||
   413			    chandef->center_freq1 == control_freq + 110 ||
   414			    chandef->center_freq1 == control_freq + 90 ||
   415			    chandef->center_freq1 == control_freq - 90 ||
   416			    chandef->center_freq1 == control_freq - 110 ||
   417			    chandef->center_freq1 == control_freq - 130 ||
   418			    chandef->center_freq1 == control_freq - 150)
   419				break;
   420			fallthrough;
   421		case NL80211_CHAN_WIDTH_160:
   422			if (chandef->center_freq1 == control_freq + 70 ||
   423			    chandef->center_freq1 == control_freq + 50 ||
   424			    chandef->center_freq1 == control_freq - 50 ||
   425			    chandef->center_freq1 == control_freq - 70)
   426				break;
   427			fallthrough;
   428		case NL80211_CHAN_WIDTH_80P80:
   429		case NL80211_CHAN_WIDTH_80:
   430			if (chandef->center_freq1 == control_freq + 30 ||
   431			    chandef->center_freq1 == control_freq - 30)
   432				break;
   433			fallthrough;
   434		case NL80211_CHAN_WIDTH_40:
   435			if (chandef->center_freq1 == control_freq + 10 ||
   436			    chandef->center_freq1 == control_freq - 10)
   437				break;
   438			fallthrough;
   439		default:
   440			return false;
   441		}
   442	
   443		if (!cfg80211_valid_center_freq(chandef->center_freq1, chandef->width))
   444			return false;
   445	
   446		if (chandef->width == NL80211_CHAN_WIDTH_80P80 &&
   447		    !cfg80211_valid_center_freq(chandef->center_freq2, chandef->width))
   448			return false;
   449	
   450		/* channel 14 is only for IEEE 802.11b */
   451		if (chandef->center_freq1 == 2484 &&
   452		    chandef->width != NL80211_CHAN_WIDTH_20_NOHT)
   453			return false;
   454	
   455		if (cfg80211_chandef_is_edmg(chandef) &&
   456		    !cfg80211_edmg_chandef_valid(chandef))
   457			return false;
   458	
   459		return valid_puncturing_bitmap(chandef);
   460	}
   461	EXPORT_SYMBOL(cfg80211_chandef_valid);
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
