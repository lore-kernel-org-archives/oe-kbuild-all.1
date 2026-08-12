Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CDB40B0F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786576950; cv=none; b=YbFu7pUXVUeOj3Z3wZNqISeAzbk7bYCo+r9QimK+iuBlcC0WfHUoukuyO+U7aVfy3adrP7B8WASNVaBbS6Rx3nCQOl/NT4wXuxgjcb8H73ghY0uEmP0RmyFJYxspu2eb2+yj5lRAtx4nj2Hfiw0jkIjvcDRnExNOl5K5goK4K6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786576950; c=relaxed/simple;
	bh=HrOweiJQuCeaQJsPlDUtj+c6qRKO32NL8UiWXaciyCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN0zhCdxZ1JI8tjTByMbVLVg31KoXW6TsX5UQEBWZCWkZtCbFlcCUw1wkBJlhZYlxFjyfIG7sGLSSgxquiW+iFeUK9tSV94xFwmyGa5NDoOAPt1qVSwBlR1SctTud13gDmWQIcio5S7r+lluD70NS3f90j0ZBEwJkN3jagaJYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLMilMid; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLMilMid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786576949; x=1818112949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HrOweiJQuCeaQJsPlDUtj+c6qRKO32NL8UiWXaciyCw=;
  b=XLMilMidxNB0glJUuDJ1BcxpGg2rlvU1eYfy8d8v+sQ6Fgv4QeTpZNNr
   UZz9C8B7WQwnhJrFWD/LZqNit2JLgrRRJCOW5oLd/Sx1n3sGA0AEh/yFL
   D7ar6LPVA6ICpoPrp4i4CBNwRNzISC4fbs6NWi3yu+dPQCbU0pL/PyZq9
   +CrKsHGp5eMVd4eAOI76/SH4yqNIuPfMRqwhOQFr0D9voAQvm8/u1nxHO
   MnJ4hmgIbjaaQfMch2F8cnrV8jAaGaTkEuHvPZuNcqLI8dSTcw1oA0ZKm
   KlqTmU3XLjLRHnhUYwc3jEg6sObqwdcOa0cc5CjKCi9IdURX7Yl4/KtnN
   g==;
X-CSE-ConnectionGUID: qKHr0inCSWyt06LsjaCguQ==
X-CSE-MsgGUID: szIfWE4tTWqGwJ6j1iZNTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97809951"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97809951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:22:26 -0700
X-CSE-ConnectionGUID: Fyxh9ubzTkKxFfsWQc+85A==
X-CSE-MsgGUID: zFmBj/mKRRKxelWqDwd5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267282898"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2026 16:22:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuIH8-00000000S34-2Fg5;
	Wed, 12 Aug 2026 23:22:22 +0000
Date: Thu, 13 Aug 2026 07:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: dengxiang <os_dengxiang82@126.com>, tiwai@suse.com,
	bo.liu@senarytech.com
Cc: oe-kbuild-all@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	dengxiang <os_dengxiang82@126.com>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on
 reboot
Message-ID: <202608130757.AUMlBDHD-lkp@intel.com>
References: <20260701065533.72517-1-os_dengxiang82@126.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701065533.72517-1-os_dengxiang82@126.com>

Hi dengxiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v7.2-rc7 next-20260811]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dengxiang/ALSA-hda-conexant-Fix-microphone-mute-after-power-on-reboot/20260813-035114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260701065533.72517-1-os_dengxiang82%40126.com
patch subject: [PATCH] ALSA: hda/conexant: Fix microphone mute after power-on reboot
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130757.AUMlBDHD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130757.AUMlBDHD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130757.AUMlBDHD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/hda/codecs/conexant.c: In function 'cxt_fixed_mic_boost':
>> sound/hda/codecs/conexant.c:1198:31: warning: unused variable 'spec' [-Wunused-variable]
    1198 |         struct conexant_spec *spec = codec->spec;
         |                               ^~~~


vim +/spec +1198 sound/hda/codecs/conexant.c

  1195	
  1196	static void cxt_fixed_mic_boost(struct hda_codec *codec, hda_nid_t node_id)
  1197	{
> 1198		struct conexant_spec *spec = codec->spec;
  1199		unsigned int value = 0;
  1200	
  1201		value = snd_hda_codec_read(codec, node_id, 0, AC_VERB_GET_AMP_GAIN_MUTE, 0);
  1202		snd_hda_codec_amp_stereo(codec, node_id, HDA_INPUT, 0, HDA_AMP_VOLMASK, value);
  1203	}
  1204	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
