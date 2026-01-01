Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA325393E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767303974; cv=none; b=Tm8eT5IDD0OU9DrIntpvGU+nkwSeULjk+oM6qPmcdNN/YYPbzlFpkPsg27z3ah+4zbuL3+CybjtqjW4oXSMRYcNrZ0ir3f4UAx15mYGHrhVA9QYPu54iSYwrhxeoOyQcogy9LV4txecVdKMWjgf99pr2yuuozWrs+YzhY609zjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767303974; c=relaxed/simple;
	bh=6gpTSrHw38rl/w7scab3B2s/RjjATex9t1kgDLVPCB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kw/s+q83oxC6Ba4lePZcRlkyUK/ryzkOPkXup5AVp4zzjjq/mMOjrvdkMNY1oNQDnnPi6cfFyCgqMTxlSohnQhLoQe6EjawF6/YIh2yDNvI3mIs7SdoJLskwm/Z/ptswcrAHnqBt7hgzgeWz2Nq/PP/zaItdD0zegp1Hf1BN4qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=Nf/4hZiV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="Nf/4hZiV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso121046705ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 01 Jan 2026 13:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1767303972; x=1767908772; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5blSH3wnz7PXbFZieXRGEw5D2jrirBsMHkqQ+d/vIm0=;
        b=Nf/4hZiVCr3fCjwQIRRx8Y/JKO9TV2MBMR2U/DGM81vGgp0Z5/DuVb1F3CXwY3GZad
         8jj8AP2g2zjJjwcsFVnyy5sDGXvVv44qBADLiVGcgXzVlB3lNBH9qDVYv3eeP8sc1ln2
         7TQVUxT8PAbMP2/iC8r55nxGibFgr8ENhyOYpIONPFjXMkruGehyphsxyBPmgAVBsuK/
         0HIKHZGAEGm3tndRaP6Xsvc22g82u0u3k72EorhnF+Cji3vjqu4nLgLfZR2ww7dulNW8
         xwptdK/2gwTbvnFUXbg1Mjv+zU6quYWFYyy2nm3e6hbtMWWiIv4b+Tq3u4/YfG45NaT5
         07rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767303972; x=1767908772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5blSH3wnz7PXbFZieXRGEw5D2jrirBsMHkqQ+d/vIm0=;
        b=VPIWrZKSB2gdQcofRps3i/t26U+iQjmQ5cRLQOVYgZm4galOiOd/FQGW2oDRwiEOT6
         jwNGhwD57c0SIDxOit4i6ByIZNWXce4emRjqU63RvB5WoGzV7jL3JNWgxV927bCZrrrM
         4wxCsr1DB2l74aOT9Ndie65MTug5GxBpxuFT/lI8vrJOPnqoFJMuo7I0fkoTP/wXycWN
         aTAOgV35Ss9A2exIRJ+VC4hqOBEpcp+0o13AxL3XXa5uK6qEW92tYqVRJMBS3Gm3kZaQ
         sJyrPqK7I2E+e4qwIChcdTtuetwIlU3/7cSi7CCBfjDA2ZxNZcq7fpsHqtmU/t0FM9kK
         sXtg==
X-Forwarded-Encrypted: i=1; AJvYcCVXpOU5Qb2fq0+m1LbCS8qO7g8cWafh0yhSLfazW2zoank1zldguOpsPY3ILYisZNbau2oUlkcYtrGmFIOS@lists.linux.dev
X-Gm-Message-State: AOJu0YxjfKtckaUl0s3aUPZsa3nri2NPEjybXR8izRHDLO72xkq1sVt/
	6faqcWZHN8Tmn/VVT8zNAFjKuL8EP5k4MVV+BehEwu0KBzt1nxILpy+tFhkJZ437fSPRmqJKA04
	F+21DkD0e9HFyU3V2/NJjb88JaO+AbyTBNHG9/vxp
X-Gm-Gg: AY/fxX601ZlNScDtheg5bpKExwFDKcVgMrXFNaQzUVs3/zQC8iRgnrs0YXlPeujIbpc
	X/qY8u8bPlqSHmn1LzE+JBdrkFpxI7IglKeiR6jHZlm00VovhhpctOhjUuu7QATM3b0nFKT1V9i
	PRno77UvcupoTLbdEOmrR0376Ajh96OFUxpXQOUPg4Pv4JDwHguzP+lmR0+wboD8JL+NCkJFqLl
	SbjUXD99cYXsANs3np0ys9HlfWOHzq8sOCNcz12cfJvgUbaLy8sFM+9UfbSH0q1dn5a3nkDSxyd
	tLY=
X-Google-Smtp-Source: AGHT+IHJgF8tQVAzrXfaCjgTQEfhyOF4KU5kW7jA/hvH8rjFtgG4aiPuEmPx2T2VA2d0H5R1QMDgCxJR/dPA+u/xjn4=
X-Received: by 2002:a17:902:ec8d:b0:2a0:daa7:8a57 with SMTP id
 d9443c01a7336-2a2f2836573mr396349285ad.30.1767303971965; Thu, 01 Jan 2026
 13:46:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230191814.213789-1-jhs@mojatatu.com> <202601012235.hi5VYzYy-lkp@intel.com>
In-Reply-To: <202601012235.hi5VYzYy-lkp@intel.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 1 Jan 2026 16:45:55 -0500
X-Gm-Features: AQt7F2r5dXv7wShviUh1pTZETegtU7eYoMGvJR5K3MvdK47cld_6fVtmVPB4sQs
Message-ID: <CAM0EoMkqvGtm8=2b+D7_5O1Rmj82ed-+JJpBkeu2JGX7SJudAA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net/sched: act_mirred: Fix leak when redirecting
 to self on egress
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, victor@mojatatu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 4:26=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Jamal,

Hi Kernel test robot!

>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/s=
elftests-tc-testing-Add-test-case-redirecting-to-self-on-egress/20251231-03=
1934
> base:   net/main
> patch link:    https://lore.kernel.org/r/20251230191814.213789-1-jhs%40mo=
jatatu.com
> patch subject: [PATCH net 1/2] net/sched: act_mirred: Fix leak when redir=
ecting to self on egress
> config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/202=
60101/202601012235.hi5VYzYy-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260101/202601012235.hi5VYzYy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601012235.hi5VYzYy-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> net/sched/act_mirred.c:271:41: warning: variable 'at_ingress' is unini=
tialized when used here [-Wuninitialized]
>      271 |         if (dev =3D=3D skb->dev && want_ingress =3D=3D at_ingr=
ess) {
>          |                                                ^~~~~~~~~~
>    net/sched/act_mirred.c:256:17: note: initialize the variable 'at_ingre=
ss' to silence this warning
>      256 |         bool at_ingress;
>          |                        ^
>          |                         =3D 0
>    1 warning generated.
>

You are about 2 days late. See:
https://patchwork.kernel.org/project/netdevbpf/patch/20260101135608.253079-=
2-jhs@mojatatu.com/

[..]

cheers,

jamal
