Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6F638F96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 02:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706667709; cv=pass; b=h46wIxLhg47GHZjiWYEyc36ju6Nzer7STGxPb2Gj0vA/GCz/yXW43DfIsagZoGveNJ2isCTTNJ4SWqcuTvFCg1SfwcXuCUoh0TQKpcn62D6mCPSQiHjRF624yprH2NxofvCGLxr4CpUbJ0rOgzVhb4o2MkqQr/yeGg9fu/Eymzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706667709; c=relaxed/simple;
	bh=Bh7AtZg66NtTPKmo5Rhb7Dfj5BhPFhfHS6sFMP93+CU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Gy8jArTrUO90lf+0wWLmPTamZFic4CyjLq5U1sYXbxPzqxhVDdkcHiwPCITZCP5oXFb8YGuTy5RSDUkJArYL9fipH4sLd6U8MV7vb1pNU+ne/3DBscTFK0GDAPllz/+IwSoCPJaVtv8zG9L4YHuyQCe23DTLJAw6rbqGai7JnGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=NBPRhcXJ; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=gPEZvyo0; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="NBPRhcXJ";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="gPEZvyo0"
ARC-Seal: i=1; a=rsa-sha256; t=1706667689; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=qHXtNEo/L7n2F/E7tvidInoAhelHZVJ0iov3uvbYGVfalvYeICAB5hKUMFqHXgsAtb
    AwKO4X7ea3TgI1kx5O5O4ChI1x/b7V8jdNGiTI6bIr26my6IzEL8O30tXvQsba7QkHrN
    5WgDujmYAj9hb7ihxoZLXsblTgPpUeN0ux1HBOsi3hYUG17dNqId5bNMB2VwFdRlZddj
    pu56MX2x0+tJCS/bhgVVbMa62qfhJWV4ywQbdf3mSch94V1v/006OpKarCrlVBqjyBL8
    KWSz9Y/GiouH5s9UkAGyFW9D/uaL9S7nXQ+Zw+J07GH9bFj0IfdzH/O6gQOxnFoSMIBq
    4aBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706667689;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1RNcqkYTwoMTIdz3NS/dubKKwcOWK+yZcTlwD2dNaEg=;
    b=KDeqx+GQw8NGQMPgBQPxsmtKsoYCjsFeUGCMJ37YeNrUGErNmTHUt+ZIdiX+Yyk/fE
    plKH/NDSBI90BK/EN9ubK/IA5FrNMDkSIOX+Y1/Y3+gKiFHKfBBKnjPQIiEIelKN6W+u
    M7xhaUghqQK+IOOTTOIjZRT179xHqkd3YVhbzhR1J+LXXzukpyee2cSrefoQg9hjDTW2
    nNjFOwJCas0VtCyRoARkrqGcvjqoZyqeZeTGgB2OyVGFGLsBsn8rFNf6n5f/eQPiEHFp
    PQroPLi/gnDMkF6ogPCRfmvAl85+Yu4TN/6lWuujRz/b6m0xKWngZSQJf3Sbt7zBn4jL
    Jk+g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1706667689;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1RNcqkYTwoMTIdz3NS/dubKKwcOWK+yZcTlwD2dNaEg=;
    b=NBPRhcXJY04hLDh9jmiGLHgCIMxbVLi0oJig3W2vP/uREWMSpVhYcXBl6QHmQvb0YY
    MUdcw6UY6M7bRy6deJgeY3+mbq79P6EXbmdzQvjyLwNnMpLo16qXMzmBuLm24fBooF6i
    em/0Vn6C61RgUqagziPLdBNRwEgQS3vWrXFlpeS6ITCh7v8uidqVriy9+IgV3hRZoccl
    DzD6y8hUPm5ftiPb7cRuJKjp532Gf0J7aOuJA85fxyqBxFC4jZiV+jiArtBCXCvA3DM7
    Jf23uHBvVzntnDj/0DmIvCLkgOcRi5ZTJISW6FIsLjNVXgGiFsi0dp/yX8bvDe7qiXhZ
    kfrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1706667689;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1RNcqkYTwoMTIdz3NS/dubKKwcOWK+yZcTlwD2dNaEg=;
    b=gPEZvyo0vXuBTyggWeFS9/oUG4OyjWKfUTFoWOtoC8PUkai02/VpGgmAK+plxHMZbz
    VNkv391U482tRNz4swBg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64jlM="
Received: from ox-live-app405.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde00V2LTNbE
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 31 Jan 2024 03:21:29 +0100 (CET)
Date: Wed, 31 Jan 2024 03:21:29 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
	Sasha Levin <sashal@kernel.org>
Message-ID: <65931638.113348.1706667689205@webmail.strato.com>
In-Reply-To: <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
Subject: Re: [cip:linux-4.4.y-st-rc 878/1809]
 arch/m68k/kernel/traps.c:32:10: fatal error: linux/extable.h: No such file
 or directory
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev58
X-Originating-Client: open-xchange-appsuite


> On 01/30/2024 9:10 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> The latter, for preference. Thanks for spotting that. Where would I send 
> such a patch?

Please send patches for 4.4.y-st and 4.4.y-cip kernels to cip-dev@lists.cip-project.org. Thank you!

CU
Uli
