Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B93F184F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718851168; cv=none; b=hZVkcgCJiZePI/BJsI5ipZvsG7mgJh2SNqZ5boXxWHWtcRUtne7FFN9r8nG9IwWZuG0woGJt6psHxjs+iQLnsO0RdeSAVvwn4kQD/fIyMtndhcbXCNpN1wD1XyRTQYF1dagNccxUAZAQFVdc9+EkWVx1l8d7pSGFLNWpux2Y7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718851168; c=relaxed/simple;
	bh=iJF1dtkZcYTMbYqGRKOZaMev+ChUJeGm13VoNTqNMrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvNJnD4bNabAzULhwwCGij3MYKPkQFdc3ytLkj4a1lXkjSTvrSd3ZEJHqcp6Si72mjlqDgGWUL3vkh7eBDzWwdnuYBflqD4oYRdQjah0CfQO053spYkhn+Y8iH6Hye5WyG3fXC1YXJ/jCQa9HJ2Jr06mGkP85mwTiOwovZ561MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gYoFCL+0; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gYoFCL+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=WKuJZMj6MVNvNRGmtfO5Qy0tFwpZxPHNN/MdwiMZdgA=;
	b=gYoFCL+0HV/bPiZs6DMu3ycbip7CiY84THM2GLuVJ1yVSoW1P+ZJrjNHkGrQH1
	gEYCiwbjsW2kTTNzzMIEFoYLH+utdMzF5lVLAa1CjGSKhLtxVsZbiGwmWfctuMjR
	nm2jgf56AHhRZt7VnHfkyjSX0RawvQ6OdJc6chrMYJPbg=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrAD3X085lnNm7j5CCA--.18031S3;
	Thu, 20 Jun 2024 10:38:51 +0800 (CST)
Date: Thu, 20 Jun 2024 10:38:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [shawnguo:imx/dt64 27/42]
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: hdmi@32fd8000:
 Unevaluated properties are not allowed ('ddc-i2c-bus' was unexpected)
Message-ID: <ZnOWOEBClPpPpraw@dragon>
References: <202406171104.SmweUTX3-lkp@intel.com>
 <Zm+rYkorx7K9dtIA@dragon>
 <70b097d9-f859-4f57-91d2-4053ed9b1717@denx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70b097d9-f859-4f57-91d2-4053ed9b1717@denx.de>
X-CM-TRANSID:ClUQrAD3X085lnNm7j5CCA--.18031S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7BMKDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER4EZWZv-bO+2QAAsO

On Mon, Jun 17, 2024 at 06:41:26AM +0200, Marek Vasut wrote:
> On 6/17/24 5:20 AM, Shawn Guo wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Should I drop the patch or is it bindings that need to be updated?
> 
> It is this bindings patch that fixes the warning:
> 
> [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document ddc-i2c-bus in
> core
> 
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240515062753.111746-1-marex@denx.de/
> 
> No need to drop this patch.
> 
> I can pull the bindings patch in via drm-misc in parallel , is that OK with
> you ?

OK, I'm good as long as we are addressing it.  Thanks!

Shawn

