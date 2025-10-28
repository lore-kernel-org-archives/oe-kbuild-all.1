Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25A33C529
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 16:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669531; cv=none; b=kiiKMoAce/jwFMmZN09+qjkpSJacDRCUFyYBTRMd2tJ3xojoF+TNEPJz7TBzcetxE5nGmLZRVujWxYuOegqpKaDb9drgfRMqvPiP27Y4AtOwr6zil3gQWbDocuWoCMg1JfAyFA4hqERzlA48bAkknhLDb8qC/+cKFyegY2yML3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669531; c=relaxed/simple;
	bh=kRGui3H8zJr9jDQ6dhuLPyInsySijO7pcoXbi4c9rA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nqmeGp5Im+Qg6Pa5YbF5Kx63PTwvbHahNOIgaBgb9t/Ie6dphYlIURKpz68If/K6K9q95PwUK0dUgVvXC3vpxiRghcTfWWDLfmHo6PbSrnpVl9Y63c2vcR5Iq8By8m3lEeRhvynxkixG/dNY3SRl5n5qpXEi8M0d3SZ+9hZrWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvfviXdQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvfviXdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761669530; x=1793205530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRGui3H8zJr9jDQ6dhuLPyInsySijO7pcoXbi4c9rA4=;
  b=TvfviXdQEN7j2fPUb7BdktGA2Zd2UHVGvrnV+xu/OWyj64PJCuosqQ4L
   DBjhffqHGmYUfQdTXGmCaUP622w/EIML/8FDGMO6lsoPNVbGeBJqBnIpD
   nLcqEbP4YLrG1yqfQyTCvYkE39jyg4214wozS+sbRMye96NnTlqeCvHMh
   IMN9X/uI0CBeFQA4c5rZmuYdkg4ZLXkYmFzhwi/hzRJKwzNfRn58qJYY4
   qF++wfJuJPdORRnsBJtOjHdBtAkCDDXxkBmEMtcRZO9ZLCft2ELfhOehU
   WCSHvOEXZ2IIGrh1vKqeHxQFqY77xCReCs0npJWwv1iieETvapnQ9WdlV
   Q==;
X-CSE-ConnectionGUID: zetHWG6AQO25cpaNOYXmCQ==
X-CSE-MsgGUID: 4YR2GcqkTrG0OJUbXiojdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63663149"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63663149"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:38:49 -0700
X-CSE-ConnectionGUID: yFA/eotORfC8oPgix6nmFQ==
X-CSE-MsgGUID: LUc6JM4LS62L33Uet29c8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185095681"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 09:38:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDmiZ-000JRv-37;
	Tue, 28 Oct 2025 16:38:44 +0000
Date: Wed, 29 Oct 2025 00:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Masashi Ozaki <masashi.ozaki.te@renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc3-2025-10-28-x5h-ironhide 7/21]
 drivers/mailbox/rcar-mfis-mailbox.c:58:55: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202510290024.BNxIfrU7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc3-2025-10-28-x5h-ironhide
head:   d1a98ccbd9966984241b524b5e61df95882cd44c
commit: ef32c3846d431426fb87413b018477aad6c13d65 [7/21] mailbox: renesas: Support MFIS mailbox driver
config: arm64-randconfig-r121-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290024.BNxIfrU7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290024.BNxIfrU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290024.BNxIfrU7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/rcar-mfis-mailbox.c:58:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/mailbox/rcar-mfis-mailbox.c:63:9: sparse: sparse: context imbalance in 'mfis_interrupt' - wrong count at exit
   drivers/mailbox/rcar-mfis-mailbox.c:66:12: sparse: sparse: context imbalance in 'mfis_chan_set_active' - wrong count at exit

vim +58 drivers/mailbox/rcar-mfis-mailbox.c

    46	
    47	static irqreturn_t mfis_interrupt(int irq, void *data)
    48	{
    49		struct mfis_priv *priv = data;
    50	
    51		guard(spinlock)(&priv->lock);
    52	
    53		for (int i = 0; i < NUM_DIRECTION; i++) {
    54			struct mbox_chan *chan  = priv->chan  + i;
    55			struct mfis_chan *mchan = priv->mchan + i;
    56	
    57			if (mchan->active)
  > 58				mbox_chan_received_data(chan, 0);
    59	
    60			iowrite32(0x0, mchan->reg);
    61		}
    62	
    63		return IRQ_HANDLED;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
