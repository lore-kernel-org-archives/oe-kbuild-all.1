Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EF3DB997
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 20:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317043; cv=none; b=WOHPl/x+nqfTBp4d96e5g/zMdeiCE1Z4qbKKn0YdwXu6IDvQWVSbxkQWfDgnmv7bYNkbYZYls2Qn5YtcrMEh1z16tAwEVtHEV/8ERfbrgHnnWeb6WfdsqRs7X/pf/0XQoxFdTDRt5pi9f9EQKGFsKUfhjI1w5wnreLk468EJsdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317043; c=relaxed/simple;
	bh=mEGUjvSd3y7PzVKWsH/lR9Qsb2sS9l8k4Cjt2Yk1KV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtgKZqSEUJ/uOkJ9qPI6In6U1s1FsRXox2Fr300qp1M7mI8i1KXHKPzJhcT8fXVK4WP3Q5CWwJWf1VtYD2/zCLKalROLC5MOk5JpPUY7F5KCK++NAl/sBvLRsv+H1+NjELwghSCXhi2M2djv++K2gbZ3NuloQmIKh7mmHCPBKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com; spf=pass smtp.mailfrom=hammerspace.com; dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b=GAqlpRCY; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hammerspace.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammerspace.com header.i=@hammerspace.com header.b="GAqlpRCY"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6dfd530a2d5so479794eaf.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 Oct 2026 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammerspace.com; s=google; t=1791317041; x=1791921841; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNf/NiXnRrpD8d1Lrh5nWLifrt7ZWNX+GkRf3VdseIM=;
        b=GAqlpRCYeMfWS6jB6RQ8kKT3vKBNiY8TWN3aK58FwdD7/CXftT67HSqVYtiEtIDdOk
         oz36ty1Xa2MiZsZzbw+jGrEi/KZ4Vdqv7GC5GPFkBMGk/MFO9Pv8p/eKhWD5PY5PgETr
         Wo36MXNGwvrdWG5K+OPJD75jpBmsGTH71Ubbi2oyRh/X6JtpOWQGKUx8FYzx+UbgUw8w
         uhZGqL5AN3eSYSpOIcWdL0HC3E4Ga+2NnHIvBpXwsAi22DCbAfMXmsl2o4c4/SaQGXAL
         BzPi8w16KHY9y+x0tjlwWXYf4KjRyeSneT1uKvODUF3dVfLV8306YLWrX8OJ4QEYaS4F
         ItWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317041; x=1791921841;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNf/NiXnRrpD8d1Lrh5nWLifrt7ZWNX+GkRf3VdseIM=;
        b=BdXDzBbIXdeFUVbw26UCmsl2zFvGqzlbY3msYzLFjDQnjZ4jgS3IVNvnwHO40dO6vR
         cfNbPPvxeHJBdZd65yezoxbYUPuKjIhDTCeBFE/V8stpe7ecmaDIj6pRYDkj7JMnVFVF
         vJP225aX6cC2bows+qu6x/NeVoPRbK89AXUE4EV3DN8Xkv9BzYWDugDyLeUY+uiDAp7I
         Fuklof870kDN/t77n2QIjLtgEKkQcm1S2u6FgBvKwBUkp21ImbSUEsEBpsJtbvF0CJB/
         hJ8zoZMOSV3ihz2+R2rFj6ThiomTVH3wi+OWaIIoJsm5GR5RgwP+5vwLYzoSR0dCRtmm
         /1mg==
X-Forwarded-Encrypted: i=1; AKwUvBwJO+jhFItQ+0NWrmN/DREFpaGmHqGjgx7OxWBAiLuy/03k9fltyIQjxbiwRPSpkNh86Ft/ibIht9wSl45l@lists.linux.dev
X-Gm-Message-State: AFuF++ns6qDb012ELxYmrdRFOlI3EL1xQ6UrOqz7MX0YwpVYdxBPuNud
	xz9++KD+qsJ+WtvRH2y42KCcUYWdw1qRdo0xOHbkQZSFSbKxRSxNJcvrNuB+Pl1hV0ha0YZ6G4x
	3/hk/
X-Gm-Gg: AYBFou2y8A2TKiQTFrBMLYl8Q5gUMGTOdzw03mtNTnBfNR344C8gjYPi7731tQv1qmh
	UhMU6sN3hTwZzY8D7iYxj781dnSxaPQvSUJ2FJOIWw8+YQ1oBBp72qY5JpwTlDEHsVGiOsrH73z
	ZQi05K/4sWS8RSV2yM7VYP0NJpB4KI8O/FZnIAfyxiK4PLliaUEvnuiOmmYvKC7bl64+cXguzdL
	3GHH+piz0ovDovUmQBaxlPbbWYh5zVwqNMEWIbI9g71nFvRHOJN+SPGtEWd11OvPfgXCHyanO7l
	5cHqd0Y1u9Ot7Ii8RREzrFRQW4ceFUmj2EIpjZtl3cnmJNlEa0e4ogoKGXFR4ow7PW7B8qqJg/t
	CNECeb3uGk/R5r3wqQZVRKaldD/fty4ZfCBoBh9lTSkaTip4jTNN3d7s76I15IXV6CQ1RuarMhJ
	41UshqKwyaqRKCrrlG3ux70uTnQHo1GmaqcPA1admcdOemeXxG9M3wvdVkyaQ+sDIu9MAdBwPjg
	IjPHWcKjftkIa35Rg==
X-Received: by 2002:a05:6820:4b0d:b0:6d9:2dd9:1673 with SMTP id 006d021491bc7-6e7a8370050mr246507eaf.37.1791317040937;
        Tue, 06 Oct 2026 13:04:00 -0700 (PDT)
Received: from [192.168.254.51] ([66.97.168.37])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3f12f0sm466427a34.13.2026.10.06.13.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:04:00 -0700 (PDT)
From: Benjamin Coddington <ben.coddington@hammerspace.com>
X-Google-Original-From: Benjamin Coddington <bcodding@hammerspace.com>
To: kernel test robot <lkp@intel.com>
Cc: Benjamin Coddington <ben.coddington@hammerspace.com>,
 oe-kbuild-all@lists.linux.dev,
 Anna Schumaker <anna.schumaker@hammerspace.com>
Subject: Re: [linux-next:master 7165/14724]
 fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cast
 removes address space '__rcu' of expression
Date: Tue, 06 Oct 2026 16:03:58 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <E197ECE3-2AD6-4AE0-9D6C-8A28B84144B1@hammerspace.com>
In-Reply-To: <202610061959.iAgcNy7q-lkp@intel.com>
References: <202610061959.iAgcNy7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 6 Oct 2026, at 13:35, kernel test robot wrote:

>>> fs/nfs/flexfilelayout/flexfilelayoutdev.c:361:15: sparse: sparse: cas=
t removes address space '__rcu' of expression

>> 361		old =3D unrcu_pointer(cmpxchg(&mirror->dss[dss_id].mirror_ds,
>    362					    NULL, RCU_INITIALIZER(mirror_ds)));

This comes from riscv's _arch_cmpxchg(): sparse checks the 1- and 2-byte
__arch_cmpxchg_masked() branches, which cast __old/__new to ulong without=

__force.  Those branches are dead for a pointer-sized field.  The same
unrcu_pointer(cmpxchg(..., RCU_INITIALIZER(...))) form in
fs/nfsd/localio.c and drivers/dma-buf/dma-fence-chain.c should warn the
same way on riscv.

I don't plan to change the flexfiles code for this.

Ben
