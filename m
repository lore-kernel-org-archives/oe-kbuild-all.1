Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142E17A2F0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760982532; cv=none; b=D5agFCtvazpdAqUDJkth49oKGklx+dtjPstCFTNqqm8cdvulVRoOdDr12XRNhzB9AXOEsTFDdsjly6tnX7PSaR05BPdSV+m8btn5hcI1V4jdjOhR5y1VQPPGgIBzAgZ+JKFIlH4rLhsjuk1paHTXVvd/lAsWKwpxNObQLuBRiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760982532; c=relaxed/simple;
	bh=vvj9rbshDG/mJYIvIFilBgDtfu0m0YbNFbdyps7CYhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHV+RCOV4OGyjqEf2FRuUddOcWgFUHplqI7VKLFF3onFLXhyvbBmqwuk7vZb03iScd0r7/OthDCFwkN3Io9c7Rr1J0zPav7ayDuWy5aizTdNv1/whKkCxF6ZisxsBjX8OKjosbYnIHWznONVlI624kKNfRAOhBtjRQphV6QqvDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWS03usp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWS03usp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECB1C2BC86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760982532;
	bh=vvj9rbshDG/mJYIvIFilBgDtfu0m0YbNFbdyps7CYhE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qWS03uspr/+EU7uKRG8b5qkFtWd3MFERaPNEpBVnatzdCYP+dU6tXN8yo6AIHjUPf
	 l8WyW3lZQYqgtBhgO3sghRn+qCQ/FT+pClBP0As2h5KD2byP7wc9lbkHXpw/SYQDC+
	 yR9nUJ16ArouLLTry3LyAqudO2fv4S71+9Vf/yzZILpy7KagzwsKNB99Cbx1NNUSG3
	 6dUUgMsWsrn8swmOekAQh4lPtAU86WHNGDxDJTmoha/jyrE58Jl6/U7jDtk8ft37ik
	 SxDWwM2UxJjsHkiGZSohp7HqjFCTUpt/gSM/MbuIvv08dWFA576pdSOr9Nb3x06wtv
	 TAybgb3SnMN7A==
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-444d3df546bso1039600b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 10:48:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0wu7BJNV0TUZv/FjgrvAPuO/QL5hU6ZPbtZXMpURV3ArH0jTEe2Osv7v8OR3cxNM0b0pQkz0yUr/Zd5eJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxzUxK2qY5jk+VoguMJIVghIEKvv7NjK28/Po+jIHbAAcTBoCJ5
	/2oPfRdEBH/mBci50VXY5IT7Sz3qp0NXPsIPTO3k1kxXqQ+klEALTtDhkhR/APm3bkxfzFP6fGq
	rVadhKBd8NWKoWMnJUpVfs/X1b+8LPe8=
X-Google-Smtp-Source: AGHT+IEBTcqbNW4WztbsFHgjbUpb2lUwnFWN4p7InrdR0RgRIFe00LDkdSaeIzpzw4iNCju0IktvgqGnApVX0bNPXDo=
X-Received: by 2002:a05:6808:5086:b0:441:8f74:f10 with SMTP id
 5614622812f47-443a30e6210mr6069613b6e.58.1760982531178; Mon, 20 Oct 2025
 10:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014001055.772422-9-changwoo@igalia.com> <202510151223.THlBK6QR-lkp@intel.com>
In-Reply-To: <202510151223.THlBK6QR-lkp@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 19:48:40 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h-gzxQQAu272z30R8+sDNHA6L=J1w+P2qfLOYF8LRdLQ@mail.gmail.com>
X-Gm-Features: AS18NWDDJNGF4sne2vfcDVyis3SAYtdDq88ce2v-uhPN9EnOmccJ14D_6NBaZtk
Message-ID: <CAJZ5v0h-gzxQQAu272z30R8+sDNHA6L=J1w+P2qfLOYF8LRdLQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] PM: EM: Implement em_notify_pd_deleted()
To: kernel test robot <lkp@intel.com>, Changwoo Min <changwoo@igalia.com>
Cc: lukasz.luba@arm.com, rafael@kernel.org, len.brown@intel.com, 
	pavel@kernel.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	christian.loehle@arm.com, tj@kernel.org, kernel-dev@igalia.com, 
	linux-pm@vger.kernel.org, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 6:17=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Changwoo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on amd-pstate/linux-next]
> [also build test WARNING on amd-pstate/bleeding-edge linus/master v6.18-r=
c1 next-20251014]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Changwoo-Min/PM-EM=
-Assign-a-unique-ID-when-creating-a-performance-domain/20251014-082420
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git=
 linux-next
> patch link:    https://lore.kernel.org/r/20251014001055.772422-9-changwoo=
%40igalia.com
> patch subject: [PATCH v5 08/10] PM: EM: Implement em_notify_pd_deleted()
> config: i386-buildonly-randconfig-004-20251015 (https://download.01.org/0=
day-ci/archive/20251015/202510151223.THlBK6QR-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251015/202510151223.THlBK6QR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510151223.THlBK6QR-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/power/em_netlink.c:228:6: warning: variable 'ret' set but not u=
sed [-Wunused-but-set-variable]
>      228 |         int ret =3D -EMSGSIZE;
>          |             ^
>    1 warning generated.
>

Please update the patch to address this report and resend it, thanks!

> vim +/ret +228 kernel/power/em_netlink.c
>
>    224
>    225  void em_notify_pd_deleted(const struct em_perf_domain *pd)
>    226  {
>    227          struct sk_buff *msg;
>  > 228          int ret =3D -EMSGSIZE;
>    229          void *hdr;
>    230          int msg_sz;
>    231
>    232          if (!genl_has_listeners(&em_nl_family, &init_net, EM_NLGR=
P_EVENT))
>    233                  return;
>    234
>    235          msg_sz =3D __em_notify_pd_deleted_size(pd);
>    236
>    237          msg =3D genlmsg_new(msg_sz, GFP_KERNEL);
>    238          if (!msg)
>    239                  return;
>    240
>    241          hdr =3D genlmsg_put(msg, 0, 0, &em_nl_family, 0, EM_CMD_P=
D_DELETED);
>    242          if (!hdr)
>    243                  goto out_free_msg;
>    244
>    245          if (nla_put_u32(msg, EM_A_PD_TABLE_PD_ID, pd->id)) {
>    246                  ret =3D -EMSGSIZE;
>    247                  goto out_free_msg;
>    248          }
>    249
>    250          genlmsg_end(msg, hdr);
>    251
>    252          genlmsg_multicast(&em_nl_family, msg, 0, EM_NLGRP_EVENT, =
GFP_KERNEL);
>    253
>    254          return;
>    255
>    256  out_free_msg:
>    257          nlmsg_free(msg);
>    258          return;
>    259  }
>    260
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
