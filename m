Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11D1642A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 04:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706675347; cv=pass; b=aiTaQ9ecIN5TOVhA8WKaSMAENdGpZwB/cQBVPzVAlPPiPKZUihP4nHJGQa8U4g74HwUgrHCY0p6GvnGcV7DDZTPBiJi2v20TtQhqmGEqZL/YwBoA5jmXjBbnxNpbNGA6gu/Bu4hdKHPX+c1USgFBfnePWLteH73aUqyahyBGkSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706675347; c=relaxed/simple;
	bh=XNp11xUBPvESaLejSsEWCrl8QUEcVDzoZe44gbFiGww=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=N1JvrHyH+FW+kqIkcSO5PPSvjD4S+jpTtvOzD96j4jq8tFwK7mkDU7lMOzRMzS08uP4gd9KXC/oVP+3UHBkhIFg5AmlKeqt/XfUANXe4pKvZ687MZaV1eeizO+qwm/x/lHJ/dkb0a+mQNWtvKGXZjsGZLLd3Omls+5zdX2SBGkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=PjKeRkGQ; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=tlYqmkwH; arc=pass smtp.client-ip=85.215.255.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="PjKeRkGQ";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="tlYqmkwH"
ARC-Seal: i=1; a=rsa-sha256; t=1706675327; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=paUBZmSNny7aipQTHJ5MihIPjSysJ0Y30P5XVkJ4FpVzDR7/H2Or0ZDlkD1eDpYDvx
    2TL06xpseBojW0fCWYlvsrgtSzDvY8YsgCarEizZmB4TjeElrK0OBhsnADwie3w+sL9k
    XLp9ZxPO2l5ChmfW6ufhkYDDJOwHB96zPmWo7NgNp5bnzHLzX+K4NcpHCRE7DOUy0749
    wUR0o9rnkM2Y40KbR04v44c3Vf8BaZSy1I4BGT6Jn6ZbfuKw0otdRn31AOxXCo/FOqJh
    nqtGBf1+sp6Jrxc7z0MdKN0N2gR0/022opzBahJriW68TOAAa8S/SekSoBwrCNSKGy+C
    fK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706675327;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CWaoWt6yBYN4tFNZWrNluRakt/M4ddc54ZpdlpcpLFY=;
    b=WYUsG+L0+jr535tsY5HgBi6V0Jlly21ZaNGgRAC+WEDqOiAxg6euZyWfhhBwrKGjhY
    Qqd1EDzBU/9bk/XmJ69X1qfWS9rGOKZdXknhSDcS0zy1IScwEsRTagUY45OXmo4P3fy5
    a+0rlrwpQxe/uv1YrvnX5NDEKrvsYUrJFHAnORnHok6Z+FygqB03WPlxoS/tF4DQQcz5
    J83X9TUV/kwUn3P2vkNiHZnAhnJDL6GVLRxXAx/ny42KUDGY+jXzSEPKadEJX5KoH8k/
    dTQ/sqNKP23Wn48RX1v2VnLFb4gYxOY1lXdb5HIYTZTM2cZKdfOh2f4oHcNT/KWPS7vn
    zTSQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1706675327;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CWaoWt6yBYN4tFNZWrNluRakt/M4ddc54ZpdlpcpLFY=;
    b=PjKeRkGQpZLHznwyEjdsZc2EWKIsJvz5ikGaKA4dS02y1a35Xmjx7ZBqyiNm/KsERK
    OMZCcAasC+ENPm3LuSHkJwcZbZg5D969ueCeTUZLMpAlQ167jY1ACxV5P9yCLG8aV88a
    LYIziCHdbaWOPr/QgVJ3zSyW4PBRqOWf+pDNVkueKb21Xqc4v6abHS7CvhpCupyo3NqZ
    /OjV/RYXhFcfc20xqxDQAmPlmS0kmbz2UPaoynetr1gVgn2RdIAi+yIh3YRFQBswYd9T
    lATZNyCj+3A9dihCX6szhbdJj5u4OMzsN12B4uGIZE/DN6I61ibegDg2pAqw2PDyH5R9
    osRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1706675327;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CWaoWt6yBYN4tFNZWrNluRakt/M4ddc54ZpdlpcpLFY=;
    b=tlYqmkwHF6nktmB/Z6AawEOKfPoUXNfvAOYU+feDYruzUKy6v1xNtd+g1tuhfYk1GA
    XcL2C5QXk+ohBqAqn6CQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x64jlM="
Received: from ox-live-app405.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde00V4SlNiX
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 31 Jan 2024 05:28:47 +0100 (CET)
Date: Wed, 31 Jan 2024 05:28:47 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli+cip@fpond.eu>,
	Sasha Levin <sashal@kernel.org>
Message-ID: <1267978738.113878.1706675327287@webmail.strato.com>
In-Reply-To: <571eaa40-e24b-1d6f-7150-d54e32c70100@gmail.com>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <65931638.113348.1706667689205@webmail.strato.com>
 <571eaa40-e24b-1d6f-7150-d54e32c70100@gmail.com>
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


> On 01/31/2024 4:54 AM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 31.01.2024 um 15:21 schrieb Ulrich Hecht:
> >
> >> On 01/30/2024 9:10 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> The latter, for preference. Thanks for spotting that. Where would I send
> >> such a patch?
> >
> > Please send patches for 4.4.y-st and 4.4.y-cip kernels to cip-dev@lists.cip-project.org. Thank you!
> 
> Just to make certain there is no misunderstanding: these patches will be 
> applied to 4.4 kernels only? I.e., not applied to later upstream kernels?

Correct.

CU
Uli
