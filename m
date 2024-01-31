Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1993E468
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706681316; cv=pass; b=fNi/7F0U67ZOfhNqDe86OIrQKxpbyuFkYavlbRZRz0luGB4MIOCEWbMqSgJ3JjoxMqwXcmEyzgo/Sz39FwpDZibP6M3VJBsrkP70M+ciDVGU5cfY8IU4UKeoSzt/JQyJtbfsCAXzEi4AeuxGoLp5Fhmm74imtyHjxV8JjffnTzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706681316; c=relaxed/simple;
	bh=Si+oRPe4GQdQH6nHFeV1YR9FvrSGdIebvyZr7RWPI8U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=J2S42rPaDl3CrphS9KxnoGGETlzbSKYqGi03fNNlntD2hNXkN/XZEhZQ/7trRNohso2WiUkY0CDUnao/OYzntDM3jdO29rCCHrtJtvONDD1gIFwIwpyfpi80q/oY6gNyG0Y4YfHHulSYb+wQXd44IJmK8GjwMt1+8x4k1EtTmdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=LAGDa5hS; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=hd2UyX3C; arc=pass smtp.client-ip=85.215.255.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="LAGDa5hS";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="hd2UyX3C"
ARC-Seal: i=1; a=rsa-sha256; t=1706681116; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ax3MhIGe40j2JO6z0GPSE26K2jh4QrXQNTnfUqj6D5H2F8t9qD4c/1u66BkJ0OYceA
    uo12ZiF18jrln+WV1c2VsK9adbZ3nUHwPJCdzF+cbi2xBufZ/LAjpCMVebdpPsTVXgJB
    AtEbqjgbtVpxAk9qJvN3mS1By2B6yFXhhN+UCNOq4HfohkiQDFrdMGG6zpoTdWgw8zox
    d88U+lIv1oyV9aa95OVgXm4GpwSYBGaJC8grZRSO6tXZD2/pNN+aPz83gk8CFQJZt+/+
    0REQdmzV0X1xHdZj1O0nrfSS8SusGkBp3Q7gQi7zKbTp7wyx2AVUyi3EaDm725U2X8Sh
    JBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706681116;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=yq3MKsACeJ4KCfTDjaIupvp8rk3k7CaJClk0JUdcEYs=;
    b=MZzoYwOlDlb2crwHbejigyzjvapN8UgGq02m97IfvzbtGXmAplXD2UVe9r9GscS0be
    1hmkgx7g0qLmtqs1UrfJwI2gB/FaSlqWlt35V24ZMD0K8iZYRrT9Axy2iMrncku7jbSr
    Gwzm1WhFj1GUmrsOGZB8IuBvk+5O5iP/KaYuYNl+hjB2h0Gh5VvHzNkoEpkFmoC/QCJr
    XKW0ZQs69nHBqpkYARTSF3er5vrSlOc0UNYd2xRNkkI9PtEZwkGd1uuv8n+hNnmrCHuF
    Y2x/hhDDX/9J5FEloS08o+1otereftJZc6LFg2k0SL45e6WFh/208g7tu6IQI310DL9l
    Rntw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1706681116;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=yq3MKsACeJ4KCfTDjaIupvp8rk3k7CaJClk0JUdcEYs=;
    b=LAGDa5hS+ygyRVsLipmpMCsXmpp1+oJkFi8PUr7png3JyROR+qdoMQslPO/PsHn2OF
    VtnA87JrIqqyMfl6jd8eMrT4B2/idem/rGz13ryTXwfm7u/Ox/Gu7W45WBjVCSNoMJdi
    87qiMq2HpGZUG9DOqo4uvcE9y+jsiRFH9Q5SmRx/12pYQRNhDDLg6x1bBkIiwFxsDfsN
    WZR/3U/lqpHDn3kUrCnVgvfWFzx/YKorhiIYEFSlc7mraZIPOiKi2C8Hc9sLuWWgnamd
    yLWcmXXg0zWr5ZIT6dNOVz8e+jz8UT6tx2HNOuzrf0co8M/0uffC++Ym7gJ03EewiLXV
    50Qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1706681116;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=yq3MKsACeJ4KCfTDjaIupvp8rk3k7CaJClk0JUdcEYs=;
    b=hd2UyX3CX0/6n4DerNhgUKbfoqE219Al+nMabxl8eIdgNIv7kwu3b6/CNhhR0rbn5l
    0mPWsGnUKLcEGDMQJtCA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64jlM="
Received: from ox-live-app405.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde00V65GNp3
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 31 Jan 2024 07:05:16 +0100 (CET)
Date: Wed, 31 Jan 2024 07:05:16 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
	Sasha Levin <sashal@kernel.org>
Message-ID: <1707470800.116837.1706681116877@webmail.strato.com>
In-Reply-To: <1267978738.113878.1706675327287@webmail.strato.com>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <65931638.113348.1706667689205@webmail.strato.com>
 <571eaa40-e24b-1d6f-7150-d54e32c70100@gmail.com>
 <1267978738.113878.1706675327287@webmail.strato.com>
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


> On 01/31/2024 5:28 AM CET Ulrich Hecht <uli@fpond.eu> wrote:
> 
>  
> > On 01/31/2024 4:54 AM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> > Am 31.01.2024 um 15:21 schrieb Ulrich Hecht:
> > >
> > >> On 01/30/2024 9:10 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> > >> The latter, for preference. Thanks for spotting that. Where would I send
> > >> such a patch?
> > >
> > > Please send patches for 4.4.y-st and 4.4.y-cip kernels to cip-dev@lists.cip-project.org. Thank you!
> > 
> > Just to make certain there is no misunderstanding: these patches will be 
> > applied to 4.4 kernels only? I.e., not applied to later upstream kernels?
> 
> Correct.

Actually, they will not be applied to _upstream_ kernels, but please do mark them as 4.4 only, so they don't accidentally get picked up for _CIP_ kernels >4.4. Sorry for any confusion that may have caused.

CU
Uli
