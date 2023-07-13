Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EAC1F190
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689269873; x=1720805873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yPE9U8xhKmLZhOG3aAehr9AkgPFEJqjH9TK28Frktps=;
  b=mqe8+eeaqz3fmusHU/LqFeCCughSZEY7u/S0PeH95UbKqc/iCyHoJlJz
   hLFVcjLbKyS0wKiYo+H2dOtjmxHxehosL3ei99GZNJTTB4YW4HrZCzo3x
   hY/hN7TYpfp6tpnI9ZLS/Xf0F4mwJ6VOc9b/ab7b8b0M6xON1lV5iNkLn
   lmsQMtXuNwybj6k5ItxRDnDliepRIIUwcRqEprkIdJXjyCsUVSB4bu6Df
   j3sbU5tcdcBb4VveOA6fmNy/LbnheoiDx0B0l2YKrRPZfOSc8R6e2v4mm
   utvKEIjJXmT61krv/NeNAqJMZZ3y6lH9aw7y3O5WpqaXWGRmaXaerGX1t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="368822097"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="368822097"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 10:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812106549"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="812106549"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 10:37:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0CCDB1206E6;
	Thu, 13 Jul 2023 20:37:48 +0300 (EEST)
Date: Thu, 13 Jul 2023 17:37:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: drivers/media/i2c/tc358746.c:817:13: warning: 'p_best' is used
 uninitialized
Message-ID: <ZLA2bDX2hfLIaUkk@kekkonen.localdomain>
References: <202307080250.28r3inuE-lkp@intel.com>
 <20230710063850.o2n5yymuzdhyfqb4@pengutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063850.o2n5yymuzdhyfqb4@pengutronix.de>

On Mon, Jul 10, 2023 at 08:38:50AM +0200, Marco Felsch wrote:
> Hi Sakari,
> 
> On 23-07-08, kernel test robot wrote:
> > Hi Marco,
> > 
> > FYI, the error/warning still remains.
> 
> @Sakari
> 
> I thought your patch fixing flase-positive was applied?

It's in Mauro's fixes branch now:
<URL:https://git.linuxtv.org/media_tree.git/log/?h=fixes>.

-- 
Sakari Ailus
