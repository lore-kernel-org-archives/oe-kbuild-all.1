Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129CBFBF9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 May 2023 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684179041; x=1715715041;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Ro1lxTqddGEbr8VV6bbAs81XVg6pn3Nk7tyRW/SRzD8=;
  b=Ie2jnu2N99/bb1JmfzX7/Lu1JD5Ddfp8nqBswHVgEObwxYYH5XhyxRFe
   3xTcNK3tNOlLXJjznie6hips3IMETuxybj6XeGvhgwjoUst8I85RGl7F7
   dLKCWRpJEF4tK/jXX4KJN5oHfnY3xlbJTb3xchrDeN680qtuRu2nzZsAo
   O+dfpDHo5gUdZtp1xNSaoenDVoMCyGbsNAMn/T8rC9MQdcdRr1A1Fp7DV
   kJxsdLpDnl1KWRRrb8PFHaVprmLw5CqNj8piwP2BZci3pH8QGF2lAGwYw
   IlTRjEwv2MHuptgctrTsQsIW5swZF1fSTV3c3eAixY6zD0AN8vWhoVTVg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437632771"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="437632771"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 12:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="845388028"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="845388028"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 May 2023 12:30:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pydtw-0006aI-0G;
	Mon, 15 May 2023 19:30:32 +0000
Date: Tue, 16 May 2023 03:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm: panel-orientation-quirks: Change Air's quirk to
 support Air Plus
Message-ID: <ZGKILHTDLSRcUwt9@e0f96cf4e6cd>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515184843.1552612-1-maccraft123mc@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH] drm: panel-orientation-quirks: Change Air's quirk to support Air Plus
Link: https://lore.kernel.org/stable/20230515184843.1552612-1-maccraft123mc%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



