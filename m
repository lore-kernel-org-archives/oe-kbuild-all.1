Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2315144CAF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932351; cv=pass; b=QmtD4eU/W3K3dy+qHp98ZdczM0unjgF+Goe35RvCpAX3E/RaOoOcgz7UhhqP5tktnS16atjZUhIY9mpjFkLpmJVOBJXv2LieME5Y79VU5PnvdTWaI17wciVp3nq8t3ONRD3fkpKoYGBMxlhk7slOHVLXLCz/PSBunjxuU4GMaYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932351; c=relaxed/simple;
	bh=Hvg8v2/E1mMoTGJSz2G5Kc+jGgeTMBGf9F/Gss6DWgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SELTA4GjIhhBclQK9N+ISOGPxRbJl85dOxcZHHNJqIe/hchrQZrtD/t3fTC3+BAjE6UwY78Rk4DiZqgYjMboTiNZvo7YfNZI+jMWyZLC2Mm2udXooFIrPb/5n/yZvCnWhnotJH9Gnxx6PvLFj5+Syfte1ZQvqUTbNcmukkOzAGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuEwFldd; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuEwFldd"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7927541abfaso54154907b3.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 10:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768932348; cv=none;
        d=google.com; s=arc-20240605;
        b=B0WNxFpSiSZV08nJPnCnHuTef/uxnL7vyEy4RIuGaWrvOU+MBLR218IWFtJRJdBkGa
         XBhrxsj+AD4Q1fKXbx3YjaYQLJxYmyDv7q/5TbXmRorNnSOpZRJXUiw22x+xOzmxlEbz
         wfpqIe074wggPEWWCjSuY3T0zpuVuNDA5C7r4ii6A/XIkWus+MOQZL6Wyo4QS9ZnJ/YR
         LEKwTXei3qEaq4xjLoLn446x8i5nlk/8VNXU3g4tB0Z5w4sr7UlpMt0cDEy2MLAYetxo
         LfS7lxhOou65b0TMeJGbSseuPrtbOl06IabhB3gCnJEsskuqm9kv5cr/rV+7XHO1jIsZ
         n5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CjJDNN7W0lvRxWEjNm2RRgk+05KYOO4beij0BZs+558=;
        fh=HM8eul6+RZy91vIs5yPsEb9b4jb2iGfAxPeOBGIotdI=;
        b=JLZSSC1+2m+iazyEYvUThk6nSKq8XLlBI2CtQwTCjJlwVzkI8yDUqqnp1+Kg8imJGq
         ZeRVzvNiBblxgUM4biWphcEW2Tt5Eqiu2tx9ktbUynPdqunKAX7rod2Ueg3ny+2a00TD
         pDX7QGxdyOVs+GbZA5nzCQ0qbUPmFo6gvKZ7kpcVXTU74LU0yLJ+uPLSe+TTv6kacdll
         L1uCDcorH/IXm259P+QNWaRFk3TKaYz8hhbrXW5VFF4Vyb9HywJi7KpCrEl3oGkp6d8T
         K3bQVImsrYbWK5LahMHDnMT/CrRM4Jr1q+9fQTZrRIn/S8rVNaoK6mZm0s4bCTZ3T74W
         ouzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932348; x=1769537148; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjJDNN7W0lvRxWEjNm2RRgk+05KYOO4beij0BZs+558=;
        b=LuEwFldde8r6HJgbVJBhTFkrPSLBOyfzGKOJrlWqnSN4xFylUf0F2svjT02Ok8JFKv
         BgPRfzaenW4tyxYFkmFOduBz1o8bYh0dDXsOdFGgTwFuCqD5ns23GWljddumYFUt2Vqd
         YEfGYXl/lJ4C+s5+fUHToeV6RuSvuanW0Z3UebtL4vspvStOp6zAcSKzoHart+rM7F7z
         oMY0qg/D1MUgfMKC2BXAZirgVkMmrW6Uueoh7dcM+rPi8kfe83MkthyjrHagnf5F3ZE5
         //WEDLJVd8Kk2Doyob9U6A54y4LOZ2uG5+mC0Ik3vrMfjJozzJbII9A3Hj5vVgLcy5BD
         dbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932348; x=1769537148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CjJDNN7W0lvRxWEjNm2RRgk+05KYOO4beij0BZs+558=;
        b=mIn5VYGYxwvXCvejpLmAr48U0orDAmDZfKUdZAgdAyJUOLB8WswB0Z+qHWphU44a4g
         N5KqOBob6VoLLQl8TbYm47pBMspyx8ECjplyu3GpBauTLE5tIuqRG1OPC1p2W2OZEVme
         9/iAQ6ayVfYSH94IOLIkE9FyWta8UB7YoGtyQnzcXImP28qDUP/1SUlSe/+ZpBJMQEMb
         yjsfDICc6DKlUIaCkvoyE+onZ+d6v3Vx9drB3q7eD8W68nA5t2ZrWUHJugEO1kc+IuqK
         yPPYBAIJRp0jaalt8qWISbuuNxWpPCfkPj02IsXaOJjJ8w5C3poGSMXtCthQSWVNKsi1
         RRzw==
X-Forwarded-Encrypted: i=1; AJvYcCX1kalufPjc1fXN9O4xXXrz1ijB9ZuX/zOIrb1vqHWwT5DD/Hz4u1ztekY7YmNfEUuhgr0kQnY62mnReAKg@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo9dms+Jfq09pDVZ0TtrX9Te22SWdqPytozvQPM7tQYfyMBAH9
	ckEus8dUomwYy5Kg9CcumJKAli9DvQamW5qkOv5j5zhh28OqVLMsRNeA1LWUGWXMRMcGX3b4gTt
	llnthS0k8RVeDE6C9Z+9NsbPhZVqtKPA=
X-Gm-Gg: AZuq6aK8Xgb4hEr5E1pHyr6FMss8axSEEYBUuDIa2EAg4l8X9QeA1OPFURhNTZJVgYW
	DRC2E1/xT3ufS+wT0cB+k/vD4xmHw8ZZ/uJzk3ZfW5+8cHkhfPMt8suAXvNarhvkkmkMOHy7cCb
	lDMd8FyXwZPKSNDv8ovwQlLH97jPhS2fdc8ZTJKvbnhXe1wG5Mp+abM4hcDhskOUJyYn2S7eVR2
	sGKri2n5JVeYcVp+5wjan2K9sBgpEAI6Z0HNVFPGi7hb7QcaqKZaiaDWk1pdt+3AlgwqDhWNzML
	cohWV0+huAit4MYbsu0qX/GeuWukQZ/vK1mpYiEzm2jK73t87pK26MnBnQ==
X-Received: by 2002:a05:690c:690e:b0:788:1eae:3d7f with SMTP id
 00721157ae682-7940a4b0168mr21195427b3.70.1768932347519; Tue, 20 Jan 2026
 10:05:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116125803.598552-3-hadess@hadess.net> <202601170322.MZrwlt6M-lkp@intel.com>
 <AS4PR04MB969210BA5934C14282B8F104E788A@AS4PR04MB9692.eurprd04.prod.outlook.com>
 <7a5b73b4c56d0bfb8742045a3f530cd3d2d25b53.camel@hadess.net>
 <CABBYNZL6hAxsnBt=HStvhnZmoTfagzGuJ0sGeqiqhXdpm0DZOA@mail.gmail.com> <c4be5c93c1d83ab8fa3ff0dafe8efc3a827e0ebb.camel@hadess.net>
In-Reply-To: <c4be5c93c1d83ab8fa3ff0dafe8efc3a827e0ebb.camel@hadess.net>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 20 Jan 2026 13:05:36 -0500
X-Gm-Features: AZwV_QhlnKzyBTpqoj3KYBD52IUAcCLoNV_sBNFFbzsGygYhPJ3O-BfCOSR1J_4
Message-ID: <CABBYNZKP3ahsqi1XVPmD24RWkXnBbOAZ9NJpo3yg-6xBY22N4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] Bluetooth: btnxpuart: Remove unneeded CONFIG_PM ifdef
To: Bastien Nocera <hadess@hadess.net>
Cc: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>, kernel test robot <lkp@intel.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bastien,

On Tue, Jan 20, 2026 at 12:17=E2=80=AFPM Bastien Nocera <hadess@hadess.net>=
 wrote:
>
> On Tue, 2026-01-20 at 11:42 -0500, Luiz Augusto von Dentz wrote:
> > Hi Bastien,
> >
> > On Mon, Jan 19, 2026 at 4:13=E2=80=AFAM Bastien Nocera <hadess@hadess.n=
et>
> > wrote:
> > >
> > > On Mon, 2026-01-19 at 07:53 +0000, Neeraj Sanjay Kale wrote:
> > > > Hi Bastien,
> > > >
> > > > Thank you for your patch.
> > > >
> > > > Just an FYI, the " #ifdef CONFIG_PM_SLEEP" was added on purpose
> > > > to
> > > > resolve such build warning reported by kernel test bot:
> > > > https://lore.kernel.org/all/20240710123426.935122-1-neeraj.sanjayka=
le@nxp.com/
> > >
> > > I didn't see those warnings locally. They should be fixed by using
> > > __maybe_unused instead otherwise the "it extends the code coverage"
> > > justification wouldn't really apply anymore.
> >
> > Yes, I think we should mark the functions that are conditional with
> > __maybe_unused, actually this might be the case with
> > btusb_resume/btusb_suspend as well, right?
>
> I believe that's what I've done that in v3. Let me know if there are
> any problems with that version still.

You mean https://patchwork.kernel.org/project/bluetooth/list/?series=3D1044=
140?
That doesn't contain any changes to btusb though, anyway I can fixup
the existing change just in case.

>
> Cheers
>
> >
> > >
> > > Cheers
> > >
> > > >
> > > > Thanks,
> > > > Neeraj
> > > >
> > > > > Hi Bastien,
> > > > >
> > > > > kernel test robot noticed the following build warnings:
> > > > >
> > > > > [auto build test WARNING on bluetooth/master] [also build test
> > > > > WARNING on
> > > > > linus/master v6.19-rc5] [cannot apply to bluetooth-next/master
> > > > > next-
> > > > > 20260116] [If your patch is applied to the wrong git tree,
> > > > > kindly
> > > > > drop us a
> > > > > note.
> > > > > And when submitting patch, we suggest to use '--base' as
> > > > > documented
> > > > > in
> > > > > https://git-/
> > > > > scm.com%2Fdocs%2Fgit-format-
> > > > > patch%23_base_tree_information&data=3D05%7C02%7Cneeraj.sanjaykale
> > > > > %40n
> > > > > xp.com%7C6f3219146a7540774eda08de5538a471%7C686ea1d3bc2b4c6fa92
> > > > > cd99c5c301635%7C0%7C0%7C639041898935601715%7CUnknown%7CTWFp
> > > > > bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4
> > > > > z
> > > > > MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DW4jhk2S
> > > > > VUr77jirvKdK%2FrKuKAVyXSbY9iO2pQ1%2BL7Fs%3D&reserved=3D0]
> > > > >
> > > > > url:
> > > > > https://github/.
> > > > > com%2Fintel-lab-lkp%2Flinux%2Fcommits%2FBastien-
> > > > > Nocera%2FBluetooth-
> > > > > btmtksdio-Simplify-dev_pm_ops-usage%2F20260116-
> > > > > 210400&data=3D05%7C02%7Cneeraj.sanjaykale%40nxp.com%7C6f3219146a7
> > > > > 54
> > > > > 0774eda08de5538a471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> > > > > %7C639041898935632879%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
> > > > > kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsI
> > > > > ldUI
> > > > > j
> > > > > oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dl2nEr61x%2F00NrtEqmvX2qhJ%2F0d
> > > > > %2Fc6T%2BI6e5YRiz1TAM%3D&reserved=3D0
> > > > > base:
> > > > > https://git.kern/
> > > > > el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbluetooth%2Fbluetoo
> > > > > th.g
> > > > > i
> > > > > t&data=3D05%7C02%7Cneeraj.sanjaykale%40nxp.com%7C6f3219146a754077
> > > > > 4e
> > > > > da08de5538a471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> > > > > 9041898935651605%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> > > > > dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo
> > > > > yfQ%
> > > > > 3
> > > > > D%3D%7C0%7C%7C%7C&sdata=3D%2BKZxHj6EXqJXKC8%2FsiYrPOJczts%2BMEX
> > > > > ycXixKcxUcf8%3D&reserved=3D0 master
> > > > > patch link:
> > > > > https://lore.ke/
> > > > > rnel.org%2Fr%2F20260116125803.598552-3-
> > > > > hadess%2540hadess.net&data=3D05%7C02%7Cneeraj.sanjaykale%40nxp.co
> > > > > m%
> > > > > 7C6f3219146a7540774eda08de5538a471%7C686ea1d3bc2b4c6fa92cd99c5c
> > > > > 3
> > > > > 01635%7C0%7C0%7C639041898935668808%7CUnknown%7CTWFpbGZsb3d8
> > > > > eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> > > > > OIj
> > > > > oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Da3gomBec5GENv5B
> > > > > RsBv%2Butzd11I3QunXE2yAaDg5f4Q%3D&reserved=3D0
> > > > > patch subject: [PATCH 2/3] Bluetooth: btnxpuart: Remove
> > > > > unneeded
> > > > > CONFIG_PM ifdef
> > > > > config: x86_64-randconfig-002-20260116
> > > > > (https://downl/
> > > > > oad.01.org%2F0day-
> > > > > ci%2Farchive%2F20260117%2F202601170322.MZrwlt6M-
> > > > > lkp%40intel.com%2Fconfig&data=3D05%7C02%7Cneeraj.sanjaykale%40nxp
> > > > > .com
> > > > > %7C6f3219146a7540774eda08de5538a471%7C686ea1d3bc2b4c6fa92cd99c5
> > > > > c
> > > > > 301635%7C0%7C0%7C639041898935685518%7CUnknown%7CTWFpbGZsb3d
> > > > > 8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIk
> > > > > FOI
> > > > > joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DhR230cwqc4FucDn
> > > > > 9TPmv79VLdAd8kHHwc2Q8SdPtHtk%3D&reserved=3D0)
> > > > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0 reproduce (this is a
> > > > > W=3D1
> > > > > build):
> > > > > (https://downl/
> > > > > oad.01.org%2F0day-
> > > > > ci%2Farchive%2F20260117%2F202601170322.MZrwlt6M-
> > > > > lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cneeraj.sanjaykale%40
> > > > > nxp.
> > > > > com%7C6f3219146a7540774eda08de5538a471%7C686ea1d3bc2b4c6fa92cd9
> > > > > 9c5c301635%7C0%7C0%7C639041898935702245%7CUnknown%7CTWFpbGZ
> > > > > sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMi
> > > > > Is
> > > > > IkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DdsZA9O8KQy
> > > > > QZJK2Fn%2FYtexA8zdrw%2FCcpwnEb7AwhiqU%3D&reserved=3D0)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just
> > > > > a
> > > > > new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Closes:
> > > > > > https://lore/
> > > > > > .kernel.org%2Foe-kbuild-all%2F202601170322.MZrwlt6M-
> > > > > lkp%40intel.com%2F
> > > > > >
> > > > > &data=3D05%7C02%7Cneeraj.sanjaykale%40nxp.com%7C6f3219146a7540774
> > > > > e
> > > > > da08de
> > > > > >
> > > > > 5538a471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63904189
> > > > > 89357202
> > > > > >
> > > > > 33%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjA
> > > > > uMDAwMCI
> > > > > >
> > > > > sIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&
> > > > > sd
> > > > > ata=3D2
> > > > > > s046Nm4SrgCfY%2BqPyoYr8tf5xqoBw%2BqDiJ0YQ%2BiAt8%3D&reserved=3D
> > > > > > 0
> > > > >
> > > > > All warnings (new ones prefixed by >>):
> > > > >
> > > > > > > drivers/bluetooth/btnxpuart.c:1964:12: warning:
> > > > > > > 'nxp_serdev_resume'
> > > > > > > defined but not used [-Wunused-function]
> > > > >     1964 | static int nxp_serdev_resume(struct device *dev)
> > > > >          |            ^~~~~~~~~~~~~~~~~
> > > > > > > drivers/bluetooth/btnxpuart.c:1950:12: warning:
> > > > > > > 'nxp_serdev_suspend'
> > > > > > > defined but not used [-Wunused-function]
> > > > >     1950 | static int nxp_serdev_suspend(struct device *dev)
> > > > >          |            ^~~~~~~~~~~~~~~~~~
> > > > >
> > > > >
> > > > > vim +/nxp_serdev_resume +1964 drivers/bluetooth/btnxpuart.c
> > > > >
> > > > > 689ca16e5232784 Neeraj Sanjay Kale 2023-03-16  1949
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05 @1950  static int
> > > > > nxp_serdev_suspend(struct device *dev)
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1951  {
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1952     struct
> > > > > btnxpuart_dev *nxpdev =3D dev_get_drvdata(dev);
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1953     struct
> > > > > ps_data
> > > > > *psdata =3D &nxpdev->psdata;
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1954
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1955
> > > > > ps_control(psdata-
> > > > > > hdev, PS_STATE_SLEEP);
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1956
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1957     if
> > > > > (psdata-
> > > > > > wakeup_source) {
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1958
> > > > > enable_irq_wake(psdata->irq_handler);
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1959
> > > > > enable_irq(psdata->irq_handler);
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1960     }
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1961     return
> > > > > 0;
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1962  }
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1963
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05 @1964  static int
> > > > > nxp_serdev_resume(struct device *dev)
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1965  {
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1966     struct
> > > > > btnxpuart_dev *nxpdev =3D dev_get_drvdata(dev);
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1967     struct
> > > > > ps_data
> > > > > *psdata =3D &nxpdev->psdata;
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1968
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1969     if
> > > > > (psdata-
> > > > > > wakeup_source) {
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1970
> > > > > disable_irq(psdata->irq_handler);
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1971
> > > > > disable_irq_wake(psdata->irq_handler);
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1972     }
> > > > > c50b56664e48b66 Neeraj Sanjay Kale 2025-04-14  1973
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1974
> > > > > ps_control(psdata-
> > > > > > hdev, PS_STATE_AWAKE);
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1975     return
> > > > > 0;
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1976  }
> > > > > 658c56d5b3b3a41 Neeraj Sanjay Kale 2024-07-05  1977
> > > > >
> > > > > --
> > > > > 0-DAY CI Kernel Test Service
> > > > > https://github/.
> > > > > com%2Fintel%2Flkp-
> > > > > tests%2Fwiki&data=3D05%7C02%7Cneeraj.sanjaykale%40nxp.com%7C6f321
> > > > > 914
> > > > > 6a7540774eda08de5538a471%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> > > > > %7C0%7C639041898935740752%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e
> > > > > U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp
> > > > > bCI
> > > > > sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DIqE%2B%2BS2ZXcZb5PFvsvemp
> > > > > dQffNOiktBLNpxdDx5JJJg%3D&reserved=3D0
> > > >
> > >
> >



--=20
Luiz Augusto von Dentz
