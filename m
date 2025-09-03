Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F772E92C3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896060; cv=none; b=eSXct3PKjy+R6GshRFB4TjFCHrjgHsUCwIqudzODsFz9XSLASRntjd4zMBUXXzmK5KskSqwbKgu9eijYHHLkZ/lAWqMhWCzDbv7ffKBARppLKl91SNcst4Zg/oa2h8D6THuBbLrgrmCDebvCB2i+Uxr09WPBaQPybRu8HwfB0CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896060; c=relaxed/simple;
	bh=LpmqpBtoCK3foqLavnf/gT3nXQqQMez9+Y51IKoKeqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8S5BtgPCo044iFxfXu7DvVESjVvBORY3gijNoT8eHYcH5RW2j0INvRuQzII063kLwKQWBjCJY+BR5lzI9pwbEGFVlsWzHM1IvqTuBb44q70I8CZ3MDh5s+WB2l1YB3oCZAp41sABPK8LQ3J9MYLD0R5g/vyQuJQziRklAApYBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OmCyJztz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OmCyJztz"
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E1F318D4;
	Wed,  3 Sep 2025 12:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756895989;
	bh=LpmqpBtoCK3foqLavnf/gT3nXQqQMez9+Y51IKoKeqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmCyJztzwjEKmjHRiapnTC8znzPhNPrF2EnEyOG8e4KQQxgsHEfU6+u0qfel0kzUN
	 93FhyJccgz6JqEXH2oDN7S+mMX1yCcGws4GhpUaAGxpKfMMIc0LxhmIml216inc7ag
	 qKnUEfHsxqhAVzExzcqgxJUR3deF+LXXvNFd4g+Y=
Date: Wed, 3 Sep 2025 12:40:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Guo <shawn.gsc@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4756/5291]
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
 isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too
 short
Message-ID: <20250903104036.GA3648@pendragon.ideasonboard.com>
References: <202509021101.Bz8COtDw-lkp@intel.com>
 <20250902092012.GG13448@pendragon.ideasonboard.com>
 <aLbmz--3Y2eKVuYN@dragon>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLbmz--3Y2eKVuYN@dragon>

On Tue, Sep 02, 2025 at 08:45:03PM +0800, Shawn Guo wrote:
> On Tue, Sep 02, 2025 at 11:20:12AM +0200, Laurent Pinchart wrote:
> > CC'ing Shawn.
> > 
> > On Tue, Sep 02, 2025 at 11:33:28AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   33bcf93b9a6b028758105680f8b538a31bc563cf
> > > commit: acfaba169385bfa243a10a027f8272a974b2288a [4756/5291] dt-bindings: media: rkisp1: Require pclk clock on i.MX8MP variant
> > > config: arm64-randconfig-052-20250831 (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
> > > dtschema version: 2025.6.2.dev4+g8f79ddd
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021101.Bz8COtDw-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202509021101.Bz8COtDw-lkp@intel.com/
> > 
> > This is fixed by https://lore.kernel.org/all/20250616011115.19515-7-laurent.pinchart@ideasonboard.com/
> > 
> > Shawn, could you merge that one quickly if possible ?
> 
> Done.  Sorry for the delay!

No worries, it's my fault for not realizing we would have an issue in
-next. Thank you for picking up the patch.

-- 
Regards,

Laurent Pinchart
