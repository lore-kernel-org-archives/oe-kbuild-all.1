Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D1572618
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560776; cv=none; b=t+LR0hs8V+rCh3FOT0sxJLH5X6//keF/TH1wxlw6jCQMDLNitGuDDysAL3ewS28Xck2+J0t6aOChzdASPpvrMT3PrffPBwYJ/qZdBg9dhNqi4wwsrX/QeuXMXHKr9aF+pHPHAx99Ej3uNy7z7mBonGpdhjbsJARQX0XbFjermYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560776; c=relaxed/simple;
	bh=EfrCHtKQ2RkR4JNDWg2D6SqkrXrN0NxL1Y1ls1PhtwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC4sxsLlCzV1q2uzL5wfFllu8SsSZgqT+0lP159D7BDe7mDLuJ3mwpd+EE1Sb1tOmned4Z9tdyJFK62aZFfWWmionu2KeJoAvxiN8bNVTC8AR/P5XSK+JjRSq9L6rd8+KpoHY5uglK6zSdAnx2ppzKCBTMo71K7DLvPjqL3itoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnmqXkPH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnmqXkPH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso11489771a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 06 May 2025 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746560773; x=1747165573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A3LKXcKbQRzOmieF/B3aokjKJXQ0R9uCqIUYyekQaA=;
        b=SnmqXkPHFrrLlWUaPTwpUGNtWiLFuk7sGzL/BCbvjbyeTZpBJEPCswg5ekySJEuT+Z
         FkeEkToNpcN6tyNaeEzJ7/rG64wfm21gcvdM7W0GeVFF5WY8nrECepLa1cZ8MU4JPpnp
         GwG1WUMOE8aVJjZzv3TQIB7WAKPZdMqiWHdm2z2Ed4BkPHT6BNMgBsiSwkzV/xFyGFc8
         nz9ST7SRKGKMISueFiNCRMwu6me1Fu93KE+BK0ZlNzBjzGl1TDuw16h7VEwiwj11E4jX
         byownWsdx4fGu5d95OzEZKqOQyEuMWUzNr10cDOc6K7494JrA8s8Qik0krejVKbd72zu
         cOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560773; x=1747165573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A3LKXcKbQRzOmieF/B3aokjKJXQ0R9uCqIUYyekQaA=;
        b=Etx/Ze6aVwLpUaepAbhxkWTuxhRpiJrasznMyHYdaXp3yISBXtf8CMTjcGP8Z4pG8L
         d/4jdS1Jk+83pz8E0TjTXy/GuRd2Ji5Bo5O0CBr00e1dGjG8aWj7k19dD+uS+b177WUL
         jSFaH09CFPRBTsw4m2ohpWoiYWk/xfaDBUoMBiAs7oZ97prbx+DkC/4fr6vhrNS2kDt2
         ktJNTJNwtIxWFWWFEqWze8RECjggE0wuCO/CWULUxbFgSMD8GZweoESgx2SkMDg8dMrR
         K2oBr1vOxZyxt9JLSJyeVQ8NY4HfHFhpziJZgdxXP3qvw8XaCRpLt5MQW2lL1tn7+mnR
         lA1A==
X-Forwarded-Encrypted: i=1; AJvYcCWKzgdWle8qSQs2qx1c/QrsDvNhxlP6aOIBnyj/glck+GJ//sIf/Xs6xzBbBHMqNfEQC64nRSwhsqeUXEsD@lists.linux.dev
X-Gm-Message-State: AOJu0YxaTBP04nckg5KuwwM1XgAfAzpqlYLcV1KEqo5xBR5Oe+I8YZK1
	aSlesO86ZZ8wfrtTG3LCFpw5gZ2beUPePomli8a9qh6Eh/ROCNsUzdBnSsTRU7I9yVw6fjICRkT
	GjrEm0YPwu7aOmDrCdnCJ6pfULoY=
X-Gm-Gg: ASbGncugQQ3qMQ4gixxsKBhjxplLP+kr/rYIEO+isztq3GMUAEw2b76BhUTi9o6jTHJ
	dlLigtguaaMUMVM8m7zEVKo/psiVVF9bK3GHbuOe3rN+cvY5rTHumQNKR77sjeuDLBkfH1SgE2d
	uJx6jnthTuh1iT+EZysNFlP4A=
X-Google-Smtp-Source: AGHT+IH+DCQfnj+qWC+qZV6cPXJm9upBQAEspihuVpc5dbc1zorkI9URLgKeaple2qN2bMjFVkNmBm+gQ9ZSeVWAhlI=
X-Received: by 2002:a17:906:ba90:b0:acb:ba01:4a4 with SMTP id
 a640c23a62f3a-ad1e8b91708mr81253666b.3.1746560772980; Tue, 06 May 2025
 12:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250423194958.30715-1-linmag7@gmail.com> <202505051339.kc4bhqlt-lkp@intel.com>
In-Reply-To: <202505051339.kc4bhqlt-lkp@intel.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 6 May 2025 21:46:02 +0200
X-Gm-Features: ATxdqUFA64GmO5svmNDpACVB3gWIvGC2bl8EQg4prGGJLCyBoJH_JupI6HfaaOU
Message-ID: <CA+=Fv5SBcjqE=Xdjb8_YQrs1K3f4-vnY0PQ2KNg-Zetw01f_zw@mail.gmail.com>
Subject: Re: [PATCH v2] alpha: machine check handler for tsunami
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, richard.henderson@linaro.org, 
	mattst88@gmail.com, arnd@arndb.de, paulmck@kernel.org, 
	glaubitz@physik.fu-berlin.de, macro@redhat.com, mcree@orcon.net.nz, 
	ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Sorry , my bad, thanks for the feedback. I'll fix this and send it out
as a v3 for this patch.


Regards

Magnus

On Mon, May 5, 2025 at 7:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Magnus,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mattst88-alpha/for-linus]
> [also build test ERROR on linus/master v6.15-rc4 next-20250502]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Magnus-Lindholm/al=
pha-machine-check-handler-for-tsunami/20250424-035141
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.gi=
t for-linus
> patch link:    https://lore.kernel.org/r/20250423194958.30715-1-linmag7%4=
0gmail.com
> patch subject: [PATCH v2] alpha: machine check handler for tsunami
> config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/202505=
05/202505051339.kc4bhqlt-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250505/202505051339.kc4bhqlt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505051339.kc4bhqlt-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> alpha-linux-ld: arch/alpha/kernel/sys_eiger.o:(.init.data+0x118): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o: in function `clipper_in=
it_pci':
> >> (.init.text+0x394): undefined reference to `tsunami_register_error_han=
dlers'
> >> alpha-linux-ld: (.init.text+0x3a0): undefined reference to `tsunami_re=
gister_error_handlers'
> >> alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x118): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x298): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x418): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x598): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x718): unde=
fined reference to `tsunami_machine_check'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
