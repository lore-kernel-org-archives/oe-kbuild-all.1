Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD903B793
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706777607; cv=pass; b=gnLtSsuvHYD2UkkL5mHOOke7B5jIKQKL0VFpU50ZBfLoL/fGwsLnCvA6lT29X3lJeEJdg+9EedF0Rm7/iMXriSBG/nuw++YVUwl3Pk8V/FWBd3mismBcAjH0Eq78/uiz1LaftNPBBnh4TF0ZrinSMZMhHSIp9R7O/05yUsGYaew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706777607; c=relaxed/simple;
	bh=froKKrnVXDeXosDRbd7rxz1/oLIgEoFW657ZNgewkVc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qR7yc+mtRpODDZ/WQMoLfj9HA8+UrWUji7LYIqqQWEH3yUZijDtuMQq4yE/gVDvpMUdqlcou9m9Q4Be91VwxhMnYV99LvfAzK2dP0ibmjVS3QumE6DycRl1pGhrZBMIGcfso7DFQAW20p6Hj+dRI8sZC3RO5vDw1fmaHPYXE8mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu; spf=none smtp.mailfrom=fpond.eu; dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=A81QSQlo; dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b=Y34JbuJf; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fpond.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fpond.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="A81QSQlo";
	dkim=permerror (0-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="Y34JbuJf"
ARC-Seal: i=1; a=rsa-sha256; t=1706777587; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=aGqaClWDZ04YEZ0H7kEIwmAo8HXGT/W4jcnRTrhbOkFKFXrAlGJwNTe0z5Tru4E2Hs
    uQvbZr20KSZ3zlRYjvDITrqpoedVfOvv+eveN1vygzcV+YisYH4fleD5pEH+n9McI6r4
    01c5hBZmTXbAIUdiNNS24thlVbJ9LaMqtRAJomt43Orw1zNCrWoAhcEBMZIpIwmF9Acq
    wQSN9xlAJ0cjSlu7oRxZizymeUxaJKZn/6RQwjZAIpyLkL6z8n+rkvUbPMymQOOhc5cr
    e1tOGdh9uo+sVGkhoyqghN74oUn/n8FK2CjtV274KqrBXMzbjMVoZs++C3Q4sN8ov/oe
    ATmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706777587;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=XEWKbrJ4Ju5v5XkogFn/xqRh6pzfYxtWAXoYSf99EW0=;
    b=eE+6nzHW6PObtgPh1IMptyJAKjqHTObVATPBIT9vlCTGEyYBfiu2a7M8mbK/2yy1xH
    c8PEUlWXXMJ4Noj/cnRZJkHpanXcJUUVchK2pxsxzh1cjmJi+0j+inWq9S3wdsdPLUMu
    8gQy1vQ0t685nfLg7pCj/qj/YRZ9yEtqRWpRQ/M4icwjpjLWYArDBfhUtqy7mJUlFaR5
    KlpSv2XwAy/M33GqbmYBFzcdulIn4i5x/wlCzhaJJNgqG2MJ9E37bcxN7BX08czoC35V
    hXRW93oX/Bkkn6Syjl9VGBHEjMenNrRdcak74RFCk5B67J7R6IuoJ5Xj+cCMaeW+voF9
    LMtg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1706777587;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=XEWKbrJ4Ju5v5XkogFn/xqRh6pzfYxtWAXoYSf99EW0=;
    b=A81QSQloi05Gbz2YmMX9YhzrH+5XkTE3Mk46miOYn4jHfW4JJcf6I7fJ6yEVFvUKd9
    HshVO4Sl6hCpiJdJq0+QZhDPmzr4w4XmzPGNmez0XE1nnvO6oMWJgvT9H5XeVJkD2p0I
    gR8s0K06RI2piqu6gt1hN9s+TSYHOpSOcQg+lOPgtmxm5PlPSd2cM5yaZnY2tyyOA/ki
    dlaHdN/In259nPE8hQB2zckfAMtkT1g+rlDAaR5F+LWHoDPyhFjKc+9iNKcL43B7cPUX
    UyGheLiSqhr/m7UXky6x5ZCOUGDI4yLz5nB3J54lp/OjaeVhXmluyXE7wX7l83nOFUcB
    dP5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1706777587;
    s=strato-dkim-0003; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=XEWKbrJ4Ju5v5XkogFn/xqRh6pzfYxtWAXoYSf99EW0=;
    b=Y34JbuJf3TmoevbFkPcK0Zh/Smjs8rUEhmhrJi5OloQqM4O7z6w3yPsrgXo+A73KDS
    KaOsNspSHjJcAzatK4Dw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvtmYHK6dxNAtycTo="
Received: from ox-live-app304.back.ox.d0m.de
    by smtp-ox.front (RZmta 49.11.2 AUTH)
    with ESMTPSA id Z7ddde0118r7U6I
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 1 Feb 2024 09:53:07 +0100 (CET)
Date: Thu, 1 Feb 2024 09:53:07 +0100 (CET)
From: Ulrich Hecht <uli@fpond.eu>
To: Michael Schmitz <schmitzmic@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ulrich Hecht <uli+cip@fpond.eu>, Sasha Levin <sashal@kernel.org>
Message-ID: <73999659.348550.1706777587689@webmail.strato.com>
In-Reply-To: <17eb05e1-256d-d3da-5f3d-47af2fed0cf6@gmail.com>
References: <202401302324.d3o6tgup-lkp@intel.com>
 <CAMuHMdVTHrFdrJ4x7AcAJ7Y8sY9Z4ar9e_L8Sk701dBSgGraow@mail.gmail.com>
 <40ba1136-0505-acac-05cc-0a913398330a@gmail.com>
 <8cfa0192-769a-6ef0-4b59-bcfd0eb43453@gmail.com>
 <CAMuHMdVhjCJqOpLA1VYMCLDrXVkhV6qBJzUOMVA324-UyfUxSQ@mail.gmail.com>
 <17eb05e1-256d-d3da-5f3d-47af2fed0cf6@gmail.com>
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


> On 01/31/2024 7:47 PM CET Michael Schmitz <schmitzmic@gmail.com> wrote:
> Would adding 0ef7653797addea8 to the list of v4.4 patches be acceptable, 
> Uli? No functional change as a result of that commit.

If the issue can be fixed within arch/m68k, we would strongly prefer that, I think.

CU
Uli
