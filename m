Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFDB2BE03D;
	Sat, 22 Nov 2025 05:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763790696; cv=none; b=SMGSQpXMU5usifheEzBnGbLlC6YtcDitPA/ZMjqYksKP1GEN6k63Jzz0IkgI3IfMANTxF6JDHeIK8ZcFZFFx2P/orhyP5/Fmtt8y0TGYWL3SkzE48sXcuW8oeznovcoKmCyht77z8R68pZ3tNl1TrrxGPkA+gXLQ90/0Rkhd7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763790696; c=relaxed/simple;
	bh=VEIldds8H34nLA4wPYcJD56CBZDYAUNPlBWQh4QAsNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfoyGK4k4fCypEb2JvRnDdrk96aZHEwitPk9kiFphSgU2iKI1QrA3mrbclKKcso+aRuW7w6rvHA+BuNzQCvQHGRu1fQTMiOK1ZKRHQD0zduiXSRE+YM36JoBXOv66sU1jDV69uAHtIYwjE3P9L/p2G0u9Qmp9pvJ9un3QCMHCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BU/8T/3r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BU/8T/3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E165C4CEF5;
	Sat, 22 Nov 2025 05:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763790695;
	bh=VEIldds8H34nLA4wPYcJD56CBZDYAUNPlBWQh4QAsNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BU/8T/3rWVGNpboXbRkdehA9k3XXJz2qcd+8+3bp9UlI+RKN8W58AsOOizI/x6n8c
	 EAm9ytVn5mY/NnVT2qPd5lk6gc6/l5YgUOmts4q8aWawlqxtwslATclMwAfAIi3Zob
	 hTUbKpQYPPz9hEoQUuQyqlswGB46uTNnD+C1HcUImAt0BxIOVPvOljYrP/igUGhqVb
	 7K31uPFuSvhSioImLNR/xr/upLWW7WWNHqvzt8vj5ImZc6QEkieErJ0KX+txEj6oLC
	 DGDUIxiElGGclCsyp04/KzfVBquZAKaTx7xOVCG9HBNnzE6CF4/T4SsGIYC23v6Pc6
	 UxLJWyEJSZE2Q==
Date: Fri, 21 Nov 2025 21:51:33 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: Re: drivers/media/i2c/ccs/ccs.o: error: objtool:
 ccs_set_selection(): unexpected end of section .text.ccs_set_selection
Message-ID: <ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b>
References: <aSEGwejeD3f7lnUL@rli9-mobl>
 <20251122013414.GA3094872@ax162>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122013414.GA3094872@ax162>

On Fri, Nov 21, 2025 at 06:34:14PM -0700, Nathan Chancellor wrote:
> On Sat, Nov 22, 2025 at 08:41:37AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
> > commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
> > date:   8 months ago
> > :::::: branch date: 4 hours ago
> > :::::: commit date: 8 months ago
> > config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection
> 
> That change obviously does not result in this warning/error. This
> appears to be another divide by zero issue but based on my analysis so
> far, I do not understand how...
> 
> https://github.com/ClangBuiltLinux/linux/issues/2129

Here ya go :-)  After looking at a gazillion of these I can often spot
these pretty easily.  I'm not sure what the correct fix is here but this
made the error go away.

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1c889c878abd..2429c05bffb3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
-		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
+		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ? : 1);
 
 	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
 		  CCS_LIM(sensor, SCALER_M_MAX));
