Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAA49651
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 22:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720131163; cv=none; b=tzahYYPIV47/fX8/ABeIi6Iq8nFSAImlrZxyLY5i32uIgATkUN+hMZhXXE4N/siFFmcbJeXqpAxbQdLRxTCAB5uXPpaqyIiZCQufkN6zJw2o0VUvTyg0zMdiJML/fD87VSlcuveFWpsmw39ljxt17d9eTWFau93vP0aOUqtovVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720131163; c=relaxed/simple;
	bh=fRVQTvUc2movJkc/FfIHRaMe82Cfoa1Zo1wuNxKRdoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ElQZ74XGjZhOogfoM1R77d8grAifpEjm9hDdiUuGwn1LaMg4SmZlgszmX1UYnOArCyVXo0fRphQsCksTv+QogG3MwUF6iNG4XDMcWart1e6MThnMts56xk8W108eOMPaWeFS8mI0ymxzpH72Y9F63i+z+3cdIlRA8wxMTIt8Rv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6VpNFjo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6VpNFjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720131162; x=1751667162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRVQTvUc2movJkc/FfIHRaMe82Cfoa1Zo1wuNxKRdoA=;
  b=S6VpNFjo7p9SI47iAJkuLAicJz9R761fWGEvHPoJ6sBbAWS4Wm0F59qQ
   kQQehIzp5Z2VxYoEyygJCrxT7bL2nw6xeiezMtPy93QR1MqDkEWRB39ig
   LTl32w9+Y4J/Dr4qqWMXb7xemiVouSjNf7LkzN5g1jVesIj0YGL51NSR1
   4tLk17BFm4Y+Bht+hvD9lAqceOVMNMkC7CwQRNTJfeDhBdQrbbvbq5CjN
   QyNAr9NwiQfqyZ4WDcFcb8BH+mjB1IPXPZPF1TcNB34ddLIB2q2fSy3K7
   y8SzptrzZUAu+YE1HElebp4gkKIkQHScNTerMmLrj4Zt7mYrRgv3BJneo
   w==;
X-CSE-ConnectionGUID: AIspzR/fRoKy2gwO5QAxgw==
X-CSE-MsgGUID: D8jSbVbuTRa9NFAv3DUtZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21184278"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="21184278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 15:12:41 -0700
X-CSE-ConnectionGUID: MEanRZanS0Obq81ZEqVEQw==
X-CSE-MsgGUID: Dw+BuX2vTbujoHWrCDJ2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47349423"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2024 15:12:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPUgv-000RWa-1p;
	Thu, 04 Jul 2024 22:12:37 +0000
Date: Fri, 5 Jul 2024 06:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 5/6] sound/core/pcm_lib.c:547:9: warning:
 'strncpy' output truncated before terminating nul copying 12 bytes from a
 string of the same length
Message-ID: <202407050501.o5Z3bibi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   5f9f982dd71b418aeba7a0b37f87312545c06df4
commit: d712c58c55d9a4b4cc88ec2e1f8cd2e3b82359b5 [5/6] ALSA: pcm: optimize and clarify stream synchronization ID API
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240705/202407050501.o5Z3bibi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050501.o5Z3bibi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050501.o5Z3bibi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'snd_pcm_set_sync_per_card',
       inlined from 'snd_pcm_lib_ioctl_sync_id' at sound/core/pcm_lib.c:1837:3,
       inlined from 'snd_pcm_lib_ioctl' at sound/core/pcm_lib.c:1863:10:
>> sound/core/pcm_lib.c:547:9: warning: 'strncpy' output truncated before terminating nul copying 12 bytes from a string of the same length [-Wstringop-truncation]
     547 |         strncpy(params->sync + 4, id, len);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +547 sound/core/pcm_lib.c

   517	
   518	/**
   519	 * snd_pcm_set_sync_per_card - set the PCM sync id with card number
   520	 * @substream: the pcm substream
   521	 * @params: modified hardware parameters
   522	 * @id: identifier (max 12 bytes)
   523	 * @len: identifier length (max 12 bytes)
   524	 *
   525	 * Sets the PCM sync identifier for the card with zero padding.
   526	 *
   527	 * User space or any user should use this 16-byte identifier for a comparison only
   528	 * to check if two IDs are similar or different. Special case is the identifier
   529	 * containing only zeros. Interpretation for this combination is - empty (not set).
   530	 * The contents of the identifier should not be interpreted in any other way.
   531	 *
   532	 * The synchronization ID must be unique per clock source (usually one sound card,
   533	 * but multiple soundcard may use one PCM word clock source which means that they
   534	 * are fully synchronized).
   535	 *
   536	 * This routine composes this ID using card number in first four bytes and
   537	 * 12-byte additional ID. When other ID composition is used (e.g. for multiple
   538	 * sound cards), make sure that the composition does not clash with this
   539	 * composition scheme.
   540	 */
   541	void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
   542				       struct snd_pcm_hw_params *params,
   543				       const unsigned char *id, unsigned int len)
   544	{
   545		*(__u32 *)params->sync = cpu_to_le32(substream->pcm->card->number);
   546		len = max(12, len);
 > 547		strncpy(params->sync + 4, id, len);
   548		memset(params->sync + 4 + len, 0, 12 - len);
   549	}
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
