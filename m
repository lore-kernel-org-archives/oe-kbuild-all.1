Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B9370AE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217604; cv=pass; b=fps/6M/wTiP/Z8YPsdkIFrmU2SXMn2gPIuCmM5svWZflP0pLbRQK7owWXGGhrmFbp9TTMzRcji98x/jZCq302ZhpBl+RTjQOWzgY8jiUuz2ob8UJb56vPoMP0V3VjIMr08AX/XmlgIBdP2idreipeIHvAj+yEQUGyWt2CsKbyuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217604; c=relaxed/simple;
	bh=PfGX1/wpefIpzWNzuSRhv7ZZZrMl46KjkAc42CrnpUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNG7lw4k9+XqP6XvDTQXFP0Pnx6rbmFeKmCreQs5SoqbYeB+IsCCpkDvTDtYXFpMoawMakGIPqrsvZcRIL/mENzfTl8/ZuIOMRNiZTkKp3JBoetWWmBX4xUJNldM2OQpQhEXylJTg4fDuoL/pHdU9kBBtXr9naLYEBRJUR7CwFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rCrUWZHr; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rCrUWZHr"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ff20870ac7so19403496d6.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 02:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787217599; cv=none;
        d=google.com; s=arc-20260327;
        b=U/9eDzgzbQ1n5qhp0SHyqGmBSDweznNFHyfi3PLUl0wD5Y7IfWBVWIxyzrxWcPE+EW
         x7wFkz9ol1IAuS4Fuj4TmpKY4ASA6U84FV8C2kdYfnADYGyCGI/iruU9NZDAEQUlrwgu
         01p67P98zubLOZkxJ4HVoK4r2D6mBZcH3ExMJkFg+Fmw+prEV1C9sAnDuCA1LNj3nLHT
         j0/Ve7rl7X4rSpqoYBIBLnN2cG/ObOYc1NjiPTg0sK4tToRG6ZvzmBXQBU58IsBMiVWM
         UFW6GyCzeif4ewWznAVJUw5C3rs2vRh4JnRfRPDOxKdDOo3oGbFHox3a7xTwVDAX/iTI
         faDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aJfvNW4O1AiSSOmbGxVJcg0QkmSuk+rovKT2HmcAFeA=;
        fh=GWZdjKDXiw/hSlOIjCmA1AkfkJjbXgihNdWWLLSV5iI=;
        b=YN8tNKvutDpCdL03od3Nte3lnGARVyc9iAWxVmE+VJSJ9yXN1zIYy5dqWpSncjecnF
         mGnNmP/lF4WIhovMDXwwikSjIw4cOz1pYPrrh05fwGRxCEDk14EIuvf26qwOUWdiE7n7
         dF0M1tL5UXY6+z28xiIXmeCK9KjQDCm5T0pjq+SQd3rMpSiRHLXShdwHjUtV3osae3c+
         YKsy+g+fJ0lXnQVf2p5oJFV5CPIJbow48DDubo9z2iHwnEe+/7f9xdN+2wfWsPfOvaoJ
         yNb0xU0H9pTBAePCZRJ5bxbQT+sENLwZQND/bLyEvpkMozE0e+EqHZVK8aKTZat7iBBa
         h/Wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787217599; x=1787822399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aJfvNW4O1AiSSOmbGxVJcg0QkmSuk+rovKT2HmcAFeA=;
        b=rCrUWZHrfkqOsJNETcemSiP0Fn9eU1BOloz/SDXo3me8iTeJQO4cMN4xESCwlrC+Ar
         jdC1X5hbmGxHu8nHjXnGqoDivhbNTH2xQ67gm3hwt7iD/+77cgAuRFhq4zmeDN559R7i
         JDich4ltxWpKbN/tkAkk9adPQVXYCm/lZQ3jAhDEE/Goc1BPL705ofeDGT0p/t6G8XDG
         nhAr5nAZmWqOKmTnthb9pLFwG+mRY1ivsAwCBamvLszMZWXSOTNMKo7dUI2jPSoYr9sx
         2o2B8GvyN1FB2+/2dZdxUlkJZwaLsZFJWxADANRpGOsGKSLj1Uz9Rg7STSEK9wRwQcER
         8U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217599; x=1787822399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJfvNW4O1AiSSOmbGxVJcg0QkmSuk+rovKT2HmcAFeA=;
        b=mqp+rAQ3w0U3S9UePNoXIZqHnFjasFd2+ba2Ol6Z7cuVVbF1XfgAx+CHjHoervY0zb
         WMBpKbXtR+1KpHSbfTS7pNY0I3TjOLFMoRpm4SbUNbj2Jq6nhnG+Vw+gra+LdAs9+jJS
         cA0pMyt2W99fEeP3QJfegYIKkRDlN8ZDkGBdo9sOCz56QwfzoCNGom8wSyKTXMmh4TFF
         vkPwCptj2+EH3t0O78b0zf/rw/HTlzX43ZYpZPQXIcfJX3KmZmlPij+eaJmOGaPgmzFh
         YUvEZbXOT51QFyimnLqPbnrUJS5beeiDqlLD9Qkeb2Qa958kkqzVTYz0yk5RMLtGM9PC
         senQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQblE7T9mozVy/dFHb41feaUCnPjb1nuyYiwdXhCmZsK78KaT7KFwcclckSEaqcFLb7lLjXa+VH5whlVrq@lists.linux.dev
X-Gm-Message-State: AOJu0YzwOxllGujT3UR8czaKrwNaMknl5hvO6eBiMkRXN+xQfpzeZbQH
	UPeNZzcD7af4BMYbSWmqz7YV7yD0dq2MOjBQGE/yo5DOcM9SmrQM+A7BipcEJMdfG3xlNsIzEyu
	WFXnxtBLuC7U+rsZQ8AmRM2GpnUwdbWCzrJUu7Ax+co6oBaVeE+6+b01c
X-Gm-Gg: AR+sD114jIwmV7joywJkY92tOrQPtw0WzklFcDV/HAAVyfOFxLBa6w+FuLHS3xUF3sg
	ql0SxI3m/cvv4y65W1XZvgxXQzfMRKyirCi4H7Z2Il6Li7vijbM1Fdcn4SCglH07ompMnThwYJR
	S1+yIX19u0jDSf0eYtZKlVIffk48hdz3byn6OGAdPwXRmHoXh53LoMn485PniZopiaxvpkFn2kM
	yCOjC2lKvI2rC0jdweh3JfHO5Ak7GXxuo2sxTTb7glrBx9SgPrjk9ucZ2k+3FlB7SIM5JdzpnoG
	kyxcpVD7/Po2mevvl07EaoWKgTJWhNolszFjFjZaaW6JNQ+uTi2Hrqou+yA9ZziSZdRcF2pSI6W
	ZJt5gVmnrLQJgpH2uDt/Fn3dV99ib16ibLX2tkJGo5OuIBSXnzYylxPvryw==
X-Received: by 2002:a05:620a:46a7:b0:915:e670:4021 with SMTP id
 af79cd13be357-9371e67b222mr866252585a.45.1787217598107; Thu, 20 Aug 2026
 02:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810141125.1176545-1-edumazet@google.com> <202608201604.4Zj72hcA-lkp@intel.com>
In-Reply-To: <202608201604.4Zj72hcA-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 20 Aug 2026 11:19:46 +0200
X-Gm-Features: AcwNN1UNhmPI6Cu9T5MRbf4miQkt8_m-Qm1afUz4ESsXXfusjBk37G412Rz7Jzs
Message-ID: <CANn89i+BZ8HgXw5KYGxMRAoFMsfvk1GF289E73=PCN+x5n15dQ@mail.gmail.com>
Subject: Re: [PATCH v2 net] l2tp: fix tunnel and session refcount leak on
 seq_file release
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, eric.dumazet@gmail.com, 
	syzbot+d6fa74e3f19d6ee01e3a@syzkaller.appspotmail.com, 
	James Chapman <jchapman@katalix.com>, Guillaume Nault <gnault@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 10:13=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on horms-ipvs/master]
> [cannot apply to net/main net-next/main linus/master v7.2 next-20260819]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/l2tp-=
fix-tunnel-and-session-refcount-leak-on-seq_file-release/20260810-141125
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git ma=
ster
> patch link:    https://lore.kernel.org/r/20260810141125.1176545-1-edumaze=
t%40google.com
> patch subject: [PATCH v2 net] l2tp: fix tunnel and session refcount leak =
on seq_file release
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/202=
60820/202608201604.4Zj72hcA-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260820/202608201604.4Zj72hcA-lkp@intel.com/reproduce)

10 days to test a patch is unacceptable.

Please ensure reports are not sent 10 days late to avoid spamming litsts?

Thank you.
