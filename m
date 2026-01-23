Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDBA1FE46D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 15:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183547; cv=none; b=VZHNab7kHbUyiBYYq5vAMYkAQLBVxPWy+9WvPzb3LgN5I0Q8bRISgT4Zxctw/q3QfS/UT+xdqiW2ONdy0dhEAGrLlcHbpr+/qSo0K2jEbI4aL7cmYD1ZTqW4uOVfafcguWvmjWkaxN0wqblR7ebgX7rkQzvVqWv7qwHQIxvEcqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183547; c=relaxed/simple;
	bh=2Zo4HgsrmwWu+dQR2vyKALKiBwxO2WNfinCBcwJ87hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuKv3hEBQ+cREYLCvSeEwj92fv+zDjEen+deThSJ0RIsZL0Z1zuNQbfgH9EiyTkYeGVcYP6xxloMBTQi4hD+Ed4cWGjv4wPvAx7Uf1upCGFe20eHpzB0cHbDF5szPPzczULABVLjuQ/vzPmM45GSWJWBmK98JhIu5tp90ijubg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HKm+AMP9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HKm+AMP9"
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 47A6F9CE;
	Fri, 23 Jan 2026 16:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769183511;
	bh=2Zo4HgsrmwWu+dQR2vyKALKiBwxO2WNfinCBcwJ87hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKm+AMP9vphBJrO/C1sAFquKTKRImtjhsGfOhb+eqb9m8/11fTWZPWK62nZ/3Ns2y
	 BOcHi+MqOiUyL7x+HDLjsG9bTRA/vR+7QXS/I0zUjBzJvy3h6lC3NZNbmMRJ831fNM
	 QbZvBJu9Eh3tiTQQhvsTdOY7COA2R+tz5ZW7oJ4E=
Date: Fri, 23 Jan 2026 17:52:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: kernel test robot <lkp@intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <20260123155223.GC415966@killaraus>
References: <202601230809.FBjF6OrH-lkp@intel.com>
 <c2f6eb5f-0eb6-47c4-9627-d2a5dfd6abd4@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c2f6eb5f-0eb6-47c4-9627-d2a5dfd6abd4@mailbox.org>

On Fri, Jan 23, 2026 at 11:15:35AM +0100, Marek Vasut wrote:
> On 1/23/26 1:58 AM, kernel test robot wrote:
> > Hi Marek,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   a66191c590b3b58eaff05d2277971f854772bd5b
> > commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
> > date:   3 months ago
> > config: arc-randconfig-r053-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/config)
> > compiler: arc-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601230809.FBjF6OrH-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from <command-line>:
> >     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.6':
> >>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value too large for the field
> >       _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >                                           ^
> >     include/linux/compiler_types.h:578:4: note: in definition of macro '__compiletime_assert'
> >         prefix ## suffix();    \
> >         ^~~~~~
> >     include/linux/compiler_types.h:597:2: note: in expansion of macro '_compiletime_assert'
> >       _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >       ^~~~~~~~~~~~~~~~~~~
> >     include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
> >      #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >                                          ^~~~~~~~~~~~~~~~~~
> >     include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> >        BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
> >        ^~~~~~~~~~~~~~~~
> >     include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
> >        __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
> >        ^~~~~~~~~~~~~~~~
> >     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:259:29: note: in expansion of macro 'FIELD_PREP'
> >      #define VCLKSET_DIV_V4H(n)  FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
> >                                  ^~~~~~~~~~
> >     drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
> >        vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
> >                   ^~~~~~~~~~~~~~~
> 
> Hello Tomi, Laurent,
> 
> maybe it would be good to pick:
> 
> drm/rcar-du: dsi: Clean up VCLK divider calculation
> 
> that was posted about a month ago and fixes this exact warning ?

About half a month actually. I've reviewed the patch (thanks for the
ping) and asked Tomi to push it.

-- 
Regards,

Laurent Pinchart
