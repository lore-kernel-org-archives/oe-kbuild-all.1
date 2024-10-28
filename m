Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A81D1DD0C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129055; cv=none; b=sJcq3bmKzlwWNEptheAAScWWfoG40k+euONk8cLEGBE2AtkEhKxtlFXP9DzFmpaMbPJedHCs63RtY/G7wwlP/DNGnz53tyc0P+04wJEIcWmY6X8/tFhvXATLHuwxTEarf8AneCtohJIkpMCdg9ZflHpcweYhrvRWQW4uGeiN/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129055; c=relaxed/simple;
	bh=JtTrG/4GdXbrMkhit+ETrpCvKaheVe6oGpgIVECq6WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOk1CNbBMVja8SZDLr0/UYLvJ1Aw/LCQf7Q45pjlhLPfsIciYoxjscrUegDkW+cZczZ1N4n879cn5LythirHngMzEY7GN6QoRWlS/IvqP4yM3gy1WnQiNjR+kt3Vzv5X8J5BmydFPbzSKflSYuPlN1a52i3qlvWWUSnFyX/WeKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9aa8895facso718089466b.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 08:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730129052; x=1730733852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H87zT4Qpe727lS8z09w0nqgSuCfv7zoKQxxmfDjyp0c=;
        b=q2DV/CwwIMVCGVp2i09SrL8Y2f808XHgwvjkFRXk8PMGrjlmq5AvdDgPeApT8Wrod+
         3/4cqqGFrCyHwqMsngMRRczjKRQuz2lRyrgvwV3/2UYebjeRnYj3F+7nnraQnlNiftYp
         MhSQl6B5p5KUjUtMf9obaRwvfpZd2sUJoXsScXGewVdInLJ2uFX6yEVpp2u9WN+4h6hw
         FFmkBNB8c5iDNTWhv8rMNb7pGPmXF4LONLpNq+jYXkg3jYt4xRcgC4s41DVti9Z37FBJ
         vqLmH19oIyzHiJSh9md2Qxm/SgLOx3xLUO9vxIkbPCnIweAkCXMRJKBlZVnp8h1HdMFO
         zjiA==
X-Forwarded-Encrypted: i=1; AJvYcCWvqKtDilK50GLnfei9t/XD+PXwBNh80KnSX42EZ7TMTaJuKyEBAor2M5LUi3C8qMc28gT1U6IB156Wma9P@lists.linux.dev
X-Gm-Message-State: AOJu0YyRE/mHN7mkfafX++mj0WmNt5XdzH/PtUuKQZbAIpOW4gswTYw3
	pa0NAH/1NS0HPZ5TlPJV269Ys49zqg5r/8osH7sR456W7MCVRXr+Xow8TA==
X-Google-Smtp-Source: AGHT+IGLTpe4Nm/jo2HXoxCW0nbU+K+ZCwgom9UexWOG2gLUtmI2+KkwT3n6NFXwlzLf7M18Z1if4A==
X-Received: by 2002:a17:907:9729:b0:a9a:7f92:782 with SMTP id a640c23a62f3a-a9de61ea441mr761303866b.52.1730129051562;
        Mon, 28 Oct 2024 08:24:11 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-007.fbsv.net. [2a03:2880:30ff:7::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f029564sm387822166b.51.2024.10.28.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:24:11 -0700 (PDT)
Date: Mon, 28 Oct 2024 08:24:09 -0700
From: Breno Leitao <leitao@debian.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: kernel test robot <lkp@intel.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2745:24: sparse:
 sparse: cast to restricted __be32
Message-ID: <20241028-silent-hissing-ant-aacb10@leitao>
References: <202410271721.jiVrriXD-lkp@intel.com>
 <20241028-sticky-refined-lionfish-b06c0c@leitao>
 <20241028141051.eoltcyf37lf5dsyp@skbuf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028141051.eoltcyf37lf5dsyp@skbuf>

Hello Vladimir,

On Mon, Oct 28, 2024 at 04:10:51PM +0200, Vladimir Oltean wrote:
> Hi Breno,
> 
> On Mon, Oct 28, 2024 at 03:56:50AM -0700, Breno Leitao wrote:
> > On Sun, Oct 27, 2024 at 05:36:56PM +0800, kernel test robot wrote:
> > > Hi Breno,
> > > 
> > > First bad commit (maybe != root cause):
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
> > > commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
> > > date:   3 months ago
> > > config: arm-randconfig-r123-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271721.jiVrriXD-lkp@intel.com/config)
> > > compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
> > > reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271721.jiVrriXD-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202410271721.jiVrriXD-lkp@intel.com/
> > > 
> > > sparse warnings: (new ones prefixed by >>)
> > > >> drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2745:24: sparse: sparse: cast to restricted __be32
> > >    drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: note: in included file (through include/linux/module.h):
> > >    include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
> > >    drivers/net/ethernet/freescale/dpaa/dpaa_eth.c: note: in included file:
> > > >> include/soc/fsl/qman.h:245:16: sparse: sparse: cast to restricted __be32
> > > >> include/soc/fsl/qman.h:245:16: sparse: sparse: cast from restricted __be16
> > 
> > Thanks. The commit above "782fe08e98 ("soc: fsl: qbman: FSL_DPAA depends
> > on COMPILE_TEST") was created to detect problems like this, since it is
> > not possible to compile-test dpaa driver. 
> > 
> > Copying Madalin Bucur <madalin.bucur@nxp.com>, who currently maintains
> > this driver.
> 
> I will handle the sparse warnings exposed by your COMPILE_TEST change,
> there is nothing actionable for you, except review if you wish.

Awesome. Thank you!

--breno
