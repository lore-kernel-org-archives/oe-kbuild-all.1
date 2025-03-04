Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154101FCFCB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741074002; cv=none; b=iJ8syDsbIOkRTdB9fxleY4CWnHIlY2YY/9B/lGZ1+3Jzq+jJRRsQN2c0U3mV3cwwk8OqBGCyLve85UozFLqDh8c1cij7fIJdshJRFd/z/pq+5toFTw07T7MnvZi3mzosbuFKn9hdJF71z6IRj7+CTHxH40TkWCbZp72b3uw5hSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741074002; c=relaxed/simple;
	bh=/cPoc/TMUiur9aiLEE0UXTm+Uxk9qTq64gPy0uoHKDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUitNkKsPBwYVMhk88DCnfs9FHRV0S035K1Ky2eigDP2sR5oP7xlY89xYM7jvSK4qJUZE5AV9bUKX/AvXyKuj76JHuBQLNXglkOtTu56brRXidxZG9zDJFpZJTsCbaPaoL63V/hZnusOJliAeG++peUFjKZDli5OI4njNt7N0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cYtktFen; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cYtktFen"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0+9oefOO0Q1+zgsjxBDAvCIfZnRwbvJPYrI9pZeJMxI=; b=cYtktFenUVpEmhemYzKl+xZiYo
	niKMtS95efIDPTvHRx2tKElsNgGJcRJWYQMNmOAnMMuCLYTQZFexLoLewJVtbZR9ScKD5JuGjCEB+
	pLfCWUaqt7afw4yHvySTdQ9/N78DA6U7YQnGSdq8Sg+iBG2IU3YafKJja0RQvPLUtZtxSHAgVvZte
	kahppuhzpWpj3uZRiPhu33iGS5SfbkU5fcOXT5gPKUv2NlxhaNQvwewbY8BwmVvdqXlj7aJWZza19
	Ht7tWp40TmWR5JCoynwioChbg+vxDyIDoGngZYvdUn37o10G4K8enPOHa0rNLnHIlWQVfqmVo3twx
	32xzml3A==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpMsY-0000Q5-BT; Tue, 04 Mar 2025 08:39:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: kernel test robot <lkp@intel.com>, Andy Yan <andy.yan@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject:
 Re: [linux-next:master 7437/7719]
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:833:28: error: implicit
 declaration of function 'FIELD_PREP'
Date: Tue, 04 Mar 2025 08:39:49 +0100
Message-ID: <4992403.31r3eYUQgx@phil>
In-Reply-To: <965c133c-9ef3-4186-b7c5-da7319ece845@rock-chips.com>
References:
 <202503040135.fgoyWdLB-lkp@intel.com>
 <965c133c-9ef3-4186-b7c5-da7319ece845@rock-chips.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Andy,

Am Dienstag, 4. M=C3=A4rz 2025, 04:40:47 MEZ schrieb Andy Yan:
> On 3/4/25 01:20, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
=2Egit master
> > head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
> > commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f [7437/7719] drm/rockch=
ip: vop2: Add platform specific callback
> > config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/202=
50304/202503040135.fgoyWdLB-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250304/202503040135.fgoyWdLB-lkp@intel.com/reproduce)
>=20
> I can't reproduce this error on arm64 defconfig, so this let me wonder th=
at should we
> let drm/rockchip depends on ARCH_ROCKCHIP, so as to reduce the testing ov=
erhead on other
> unrelated platforms?

Hmm, depends.

Limiting Rockchip-drm to ARCH_ROCKCHIP || COMPILE_TEST could make sense,
as as you say, completely different architectures have absolute no use
for this driver.

But the error was real nevertheless. We should never rely on headers
getting included by accident. the vop2-reg.c change does introduces the use
of FIELD_PREP, so we should include the header ourself - as my change from
yesterday did. So the test-robot showed us an actual problem :-)


Heiko


