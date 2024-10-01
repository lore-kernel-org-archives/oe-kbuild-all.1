Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26031CDA18
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811350; cv=none; b=jdgEWTetyt+tpe5MYEhBO1eWrQDa3DdTCthjyjYm2RtjekJSy4PyeTzsInc7PP4oexFTEx3jOZE/wPw4ysq1hGoas0zJKgqr6/nlbgBUAmctQSQ9z5k97n/yxGpICXXukCPsMM+QgqS53QfvIG8Ik6sBOtdauPelxFJokQUprOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811350; c=relaxed/simple;
	bh=x9J72+X6RbGpK0Ne6szZE/mdMKFE9BPb4/G7X5kR1fA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVuUMsiNkFT2z683tge8pUdPeI4n2z7EWuFYRMYxG5UsQe/Rxl+pSf7I0C5Fk7oH08EOXJcpX///bYzg/FjgCx5O0X8z2d03Drq8r8Q4FyN8p9w+Dyo1ad2G1FLL0OuHQKHyROPP05+Is0QqzjaY0Mkz501bUyon5hMefsOtdnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihYAcIYd; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihYAcIYd"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e29c50ccbaso8474897b3.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Oct 2024 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727811348; x=1728416148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBLj6ECKGkCfzMGPZ8xR8xxTPPECGbgqTbKg7ceMZog=;
        b=ihYAcIYdJ21NUkHSpbnagCFjBlCYnBuFuP/5NSzXy/bvup5mZGNeFpA6VWCzcyZ3dc
         9wPQ/YIvCM/gbY4PBH/CbfD8ekCQp5bEBfCKIqIMwlUkkqAspNM8XYtNzZN/raHGVQ5g
         weTrezeYY3vMk8H8Shjt+q3/lD8EBrWKd0rrK2XlJ6q0NIRTcRh2D8BDTXvtephEXwkz
         DXPGLOYstu6yVNT56YkXbPbS1isR7rtDaNKhEVf/oGpBEwREF+UHG47x0NIxMswiMvOu
         BWYFv0ZmGAsdqOkicIpttAyawbkUneJTDZgY0AiErzZt6GEvPcj+KZ+TyuiWJSPIDgfY
         1AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727811348; x=1728416148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBLj6ECKGkCfzMGPZ8xR8xxTPPECGbgqTbKg7ceMZog=;
        b=j4WVnHrmQrk23+cv8719mFr3dc84AAVdn9qi/KlkWA+Mg7oLGTcU93x1bv8nmFAqk8
         Qw9TcgW50HTzwSU+XWJFnWTDYdM6y6W0UrbgWkv1FgQRthLeu3AJm3ffDOyZ40etJwFE
         YCmcBOfaAUYg3NDg5f6ye4gz8v2+Ki35/Q5X9xHoPsTnSeoozB0+3wErR0UXLH3ZjU3P
         wlEV7Zr3NM5IWm94Vm21dTkq2ghKBoLkc3gcRXA9hDzY5fBub3VhK2ytx6yBdx7SLbRc
         1KufW9/HhlLNJyd5OVXnucBuG61P32FPjsLMRWkptKDB5D/lsTbIC70xd+pEs+ouxAUH
         886g==
X-Forwarded-Encrypted: i=1; AJvYcCVbDng68DuLLIqhTBdn8jSNliwksJf6VxO47F9VM50GCnNpK5AhLIqTi0mNsTPSXce++ajxPNTCOZxP2r+B@lists.linux.dev
X-Gm-Message-State: AOJu0YzlnxpOGH5Jc1zZvDw5UfoePH1w+pBUNZGhS59C+J2G6sWZ2axX
	OyUkqzPEqrU8fXOWQDPq+Ys2yBHsfDgO0U1BmGOxV3Lcnjn2A54OO4pGIUOoMTSgtRa8cYYeJGL
	Eb4mbNXDk5PUHM8XjwAXZX1zk5FU=
X-Google-Smtp-Source: AGHT+IFt6ebOZXlFPwAUz87Ey07oOJrSi9nZ/86w4eb7im14Km6lgJ/qaXMMZ+KlopjGrvcKTPnMCXjquF6OdIKZKuY=
X-Received: by 2002:a05:690c:386:b0:6db:c69d:e30d with SMTP id
 00721157ae682-6e2a2b55289mr10862017b3.20.1727811347706; Tue, 01 Oct 2024
 12:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240930180036.87598-10-rosenp@gmail.com> <202410011636.QtBtiUKi-lkp@intel.com>
 <20241001132523.GQ1310185@kernel.org>
In-Reply-To: <20241001132523.GQ1310185@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 1 Oct 2024 12:35:36 -0700
Message-ID: <CAKxU2N_nBmrn__AEhOYpVaQzQBcW_1=4uwcFoYnap7UbkvdpPg@mail.gmail.com>
Subject: Re: [PATCH net-next 09/13] net: ibm: emac: rgmii: devm_platform_get_resource
To: Simon Horman <horms@kernel.org>
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	andrew@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linux-kernel@vger.kernel.org, jacob.e.keller@intel.com, 
	sd@queasysnail.net, chunkeey@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 6:25=E2=80=AFAM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Tue, Oct 01, 2024 at 04:24:39PM +0800, kernel test robot wrote:
> > Hi Rosen,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on net-next/main]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-=
ibm-emac-remove-custom-init-exit-functions/20241001-020553
> > base:   net-next/main
> > patch link:    https://lore.kernel.org/r/20240930180036.87598-10-rosenp=
%40gmail.com
> > patch subject: [PATCH net-next 09/13] net: ibm: emac: rgmii: devm_platf=
orm_get_resource
> > config: powerpc-fsp2_defconfig (https://download.01.org/0day-ci/archive=
/20241001/202410011636.QtBtiUKi-lkp@intel.com/config)
> > compiler: powerpc-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241001/202410011636.QtBtiUKi-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410011636.QtBtiUKi-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/net/ethernet/ibm/emac/rgmii.c: In function 'rgmii_probe':
> > >> drivers/net/ethernet/ibm/emac/rgmii.c:229:21: error: implicit declar=
ation of function 'devm_platform_get_resource'; did you mean 'platform_get_=
resource'? [-Wimplicit-function-declaration]
> >      229 |         dev->base =3D devm_platform_get_resource(ofdev, 0);
> >          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >          |                     platform_get_resource
>
> Hi Rosen,
>
> I'm curious to know where devm_platform_get_resource comes from.
Lovely typo.
>
> In any case, it would need to be present in net-next, when patches that u=
se
> it are posted, for use of it to be accepted there.
