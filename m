Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDB19C541
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727174315; cv=none; b=tUrqnc1WR2/zlzDXr1QP/IbE9h3J1P1rXdZwGDQHxq11+AjuonrobWEiBBRP4vVQfliud3PgqRpgbwK1z8uZg0CdqHfh+8gXLcWvkRqdvxoDsxLp45fHG8QRLm3ayCRI2hu2yN1ysS+hpkt2u/UUxJ346htkYolBcF1ptmg9ywA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727174315; c=relaxed/simple;
	bh=9rgpQ0ZDA61IQjvzXXV8QvbydpCXmPpLAOqdGolBERY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHADiHcERTCWVPaZ2PlKVytldK8CZ1gf3DFeq4dT19ea2cNAfcIyqNJ6bEAWkNfxK+xloQXS4uLr17pg1GCdeHlnCfGrBZYLMQq8p/bRZLhP5efc1GYLKnuTG3mgp13SKA0mt5UW0FFtvYIVXqjNJXvr4D3aRAAm+PSMDWQHZHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J55uZKgJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J55uZKgJ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so3729069a91.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 03:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727174313; x=1727779113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssFOFBuC8QZM0sK14vzWhYMrAs7WhfuaB+vk6WWPzbQ=;
        b=J55uZKgJejUbRW3S+CdottD5YTpXZEYtRuLHKBQQgFnqDWTuggPcDSgh8KeCKn/OmU
         Ma6ph+CffgIIVTIztbpk3eBWc502H6yiJm4CcC1QRduVp6P824aNTBVI/Bjm38cZeur/
         TDUPjZz1H6g6I5ie24prq2O3cQFvmUpzJNF/rCnfqdgEqd9yl7gJe+umRyQABeQ/XlsN
         AooD33QyOHdspovGQhpEgGU8KyEtR6/3EmAbkYdz+vhTH+3usFi3jCK7NvaebJ30KtTj
         yWC4EYteW/lJYjhv6tjmsabiMAL49M+3UjnrFuLGY2ZRy+u+zmcLOwQQVf/MX6cPg/RL
         3CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727174313; x=1727779113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssFOFBuC8QZM0sK14vzWhYMrAs7WhfuaB+vk6WWPzbQ=;
        b=jDLOZqUdBu2NxMiw62E2IDXgon7Z4UU9iA3QdiLAxM9Ib/M+S0C7f5+sA98jX/ydCN
         pl27bGRk+X0vXM9zgW4XTMTdRsfsZ5a6i62oGwPFbZsAnn1IhVxID3sOb/MPFXRG4M3z
         1IX5cvhuRuAlYI2SNWhPzz97RJySZOKIzOtrz6F5Tq034UQjGXKLep2/E+fAd8O++z13
         MQg3YVHWsuYG+LjJQnzrW/Tih8kcdAm9J7XgIZLJ1HEQSendAXluBxVS/uibP5PgutWl
         z2IGMU9jtJKgr/8mDDfVeDPJlCXrW1gMnIs5/505u7gl+kEIPHLFqhdszmGXU3/IitWX
         h+5w==
X-Forwarded-Encrypted: i=1; AJvYcCUjhvaxm2yBnPETx9+WUpNzzDuXPR4jtS25ZUcDDR7PW0N0oiuQH8enFGwdp+MerE9/+dmzwoqY1bnT61L0@lists.linux.dev
X-Gm-Message-State: AOJu0YxyWr+RukK1w2XhMHmIJctq0mIFBg0qNCM/ibz9LZhPH0QFWf/I
	KGHbDZNDgIUITJhTJ4P65curDAKVxeyHdoQ7Mwn4LgTGdUTb1pXWwOqhnCzwk8H4sphpbiB+ob+
	6wgCGJIKTfeE1uXDInAHfpT93PIc=
X-Google-Smtp-Source: AGHT+IFguKgJVQXFU2c3EhuYsKB59vYMp6YaQbgX3Vpbfe9r77vlHP79liTlX4aW9umb4mFncfhh4NC5pkkPS4eUlVw=
X-Received: by 2002:a17:90b:4f83:b0:2d8:a9af:b94f with SMTP id
 98e67ed59e1d1-2dd7f38133amr18318552a91.7.1727174312844; Tue, 24 Sep 2024
 03:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917100432.10887-1-vishnuocv@gmail.com> <202409211318.ZsE7JGOi-lkp@intel.com>
In-Reply-To: <202409211318.ZsE7JGOi-lkp@intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 24 Sep 2024 19:37:49 +0900
Message-ID: <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw events.
To: kernel test robot <lkp@intel.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the inconvenience.
The base I used was the Master branch.

Should I resubmit this patch again with the base as linus/master next-2024x=
xxx?

On Sat, Sep 21, 2024 at 3:19=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Vishnu,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on hid/for-next]
> [also build test ERROR on linus/master next-20240920]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vishnu-Sankar/hid-=
hid-lenovo-Supporting-TP-X12-TAB-1-2-Kbd-Hotkeys-using-raw-events/20240917-=
180639
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-n=
ext
> patch link:    https://lore.kernel.org/r/20240917100432.10887-1-vishnuocv=
%40gmail.com
> patch subject: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hot=
keys using raw  events.
> config: i386-randconfig-062-20240921 (https://download.01.org/0day-ci/arc=
hive/20240921/202409211318.ZsE7JGOi-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240921/202409211318.ZsE7JGOi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409211318.ZsE7JGOi-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_=
mutex.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governo=
r_powersave.o
> >> ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] u=
ndefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
