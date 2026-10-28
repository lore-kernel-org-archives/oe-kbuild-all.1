Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793186117;
	b=PDAl77EoRw4yB1Va+0U5UkKEVjGDOJPBZ6u5kZp5ObvROaw+PEHoPASrE5/cfKtqf82f
	 Mo2yytcrI0ZzfleaiBVOYDAkTOONFEtK38UU3m6Fz5QQkrMUwrhHeBX3J1bQeTAS+YmG/
	 /pFX5agfVHJEnwcZkpfkuYXcRp6sn9UfSFxiyF+a7l5hynRoJYzSyEfnEM3MDPYG4D6Nw
	 Ny1bfS5gJtUQSeoQPlMCz3pc8TjXnt+gQKGDt7SM4c2Ok9b2gFuQhf0k+qcdNo+y9P2Q2
	 EZr40DQE3w/VHlAVHW/rV99sJiojXT3YC8jUFtftKrPOx1/g+LWB3wt2dEHjZpnM5Gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
	b=IN+BJIbZvpbl9MRTiiOVjXXi+BZPixTzsTr7tYPxur+cNsizCqSwvUbidfK0Bl08eetY
	 E0z5+7lsKyHahAwgcwqseJJC2fiZkXKFZM9SteCkAeUhi5oFixZjOQEtB4TAz5wLeWAD3
	 QfHhwkaiOoVY+OMaS0z4E9LYCIN+ekLvIOyvq5LgSqCuz5gPwDBMOCBkUmIlRmHl0Q0hp
	 WCKZUkBJCdhcEWWlLLpEgLEN0u7dX61kPJ5K7fEVcwffuYZaAtE0HZWSbPS9w+L1/ZACU
	 YCmpdWigcjdU0BPkNTy/7mVovsObPVRPYiUOQeSaNL4xUuhHU8jkOsrrhOZNq9IuoeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NO/2VpQQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.70
Received: from mail-lr2-f6.google.com (mail-lr2-f6.google.com [74.125.230.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10BF606A322
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 11:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10BF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NO/2VpQQ
Received: by mail-lr2-f6.google.com with SMTP id 38308e7fff4ca-3ab1b11ca0bso3952921fa.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793186115; cv=none;
        d=google.com; s=arc-20260327;
        b=OMx6uNZ+fBqWYu9nA3b9gdUokltNEMzTKwcC7GEuutltoz7bRJnUlArYjrJt4gYXAE
         kIDAqFNF9sdpOxdl7bUeJWzs4z3GFl9P9puthJT974dWyyMLeX/QWJpcbbiTJXu7R7Pf
         rNYlsUvPOOOC9J4zXm0aSXLXyWcKl2gIgPQD1myp6YiE0aMtdRDmclHjq0R8cHg5VOId
         7A66uNFOHmyXhfxAlySsldwiU1EWraLlBGCh6y8PNO1OXrNcz6SFRYX0klxR9+s8EX1X
         A4Vzq+K6XCShUMJef7ie+2s2QL8xzdoC/+KFd2pWuwV5OaqUTRe0ePTJGBdXo3FvhvSK
         oZ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        fh=oFQUnxDSUwFtRo42FTNRJ946K9ximu70OUDYuH6F7mI=;
        b=RtaEjl8ohNTGT+8Y8XllWA+lGPQfNGoNS4cIaPhdye2SaksC2CTDB5wLscDg10dx1r
         BW4oghmw82gzws159Wrlm5w5jBrKQ/WvBO90yiWOlPUkoiUs9TefDAGk03raOW3DzN6B
         hRzYB1nuN+Vx9zD1QGo3sxWDvMmq5iK4YY2CScmLUjT2hq1okaCK5xt5D5DB+K40Kda5
         sK+KWMsSIaniCaHUPuKXM1MNGhwEzdIKM/uQgnJbVS58a7hm4VKkzl9XZupZ7hL1HALr
         3mUwvC8U5GwAAiuH6N3YXCmRYqsbkeoQa/yGt4ZmujvLdFjUCtC1hL9E5SzxksNOcEWb
         FhfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186115; x=1793790915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=NO/2VpQQDDg92e76rAHCWVk/5o70LU2sZL3ZFaikGoRA3qJyrTwyQVRHlwmcdjWTiJ
         102UGLfms3RI9gZ0g6yTjZt1YOtRSB1TDccMDPGqh2jXFFzLhln06/HC4fawwv1TCVGN
         9csKDnesCU0t13tvzxawj0dk+EuvU3ztG+N/MCqZl63/fVC5PfFUzioyfy+y3n/9kHSP
         zVwOx3lVpqDXVxpHSw0xpvXpAZb4l2uUXHbfbh/TPRSIhYIRot7hHnr2AfXBu5xazmaJ
         zTagi1hJQSnfchs4Rxm5U6TcSMwDBPabr6uayUUJqqYz9LXBpe9w5H8EB3imWm1wAd60
         /kEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186115; x=1793790915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOikoK9pLB7UPx0y1qeQcSSrhrinRq1fypsrrRrVk/s=;
        b=l7e0vh8KfKfPjkRtjJW5iTc3ArFTGdJM1llOGf6Vq+dnylUprD5sBVGMF3eCFb1Zo3
         x9Pn9glAqk/yyS89Q0hbmWTMZmlbehEqDY94UUbj5o6o5AxuLWt6/bKAToOmL1MDgu64
         YfaeIeNrhn0EpRGskrJCV5nvrFF3/TYnfLbgkmfJJsatKAf8Sdc97Kpqa2cbgMg7jj1H
         tXaFyPQL/mNpham7ZOeC6b5FPyGzPzSl9l+IY3wwESC7z5y+KzOtuIAUnGitYG65+sh5
         /CqbEcfue6TMoa1rIWrci842AAPJgD7StpFMbw/5t3z85oRjMoD353lZUwPicmBfdzqN
         fO3A==
X-Forwarded-Encrypted: i=1; AKwUvBxWbhL7KniAyifTrmyhfRl2/NcPlep8cq3prnwy4v2gy7x0fh3OukoJ5164iFr87pJhsrIEHDLxKEhj0Ynl@lists.linux.dev
X-Gm-Message-State: AFq9FYLXYY4QDZBC9upnlzgwLoCH28mfBU+mRuAFG3rBS2EkfYX4nF3M
	qTCJnj4UjRNkRkbF+8/myWFbkw9qVHsacbr3h+5ZEEUapYnWlU/Z5CkiTJ5Q0x9ogl6RrFLuynx
	OEHIJpWIIAo4ZJSRT92r4puVoSwFH+4g=
X-Gm-Gg: AYBFou015xF6R+nHGRd+CXDhluESgpSdOQV4BnQonk7sV7YXs2wImZB8oAgrAoMO3RS
	zcjQizD0f5T+RDBhKd9g3GmKDVRPI7QwseBtFkv/I9N4MvC2jynEbJXFx0MSoFzKVBRPa+t7z9S
	1QQZylI3J0Wc6ptTL6l5C5u8UsLXTq2LKGrxHzBc+lDmOe9Dp7GlLjy0wb0SJA/0ye6er3kuMcM
	Xh41W2gfL1sAyoDq0mUINq3I+OFnXj6EM8ePF7Ql4I8u6LNYsDVeSCDp0YMlU7m16c7fzFPynRp
	9c8G8ZFtgaq1GY7JQpJwiT+TzDUqMDFv/78bAynptzLOm7Eu5BaSl5Pn5GyS+zwN4FmeO8up1As
	IXEqsYpBW20yg6hq80XZM+KvE83lPJWXUoYsTFA==
X-Received: by 2002:a05:6512:401a:b0:5be:50d7:60f with SMTP id
 2adb3069b0e04-5bfcad45638mr900808e87.27.1793186114373; Wed, 28 Oct 2026
 04:15:14 -0700 (PDT)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027104713.328028-2-bsdhenrymartin@gmail.com> <202610281752.nKGCORKp-lkp@intel.com>
In-Reply-To: <202610281752.nKGCORKp-lkp@intel.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 28 Oct 2026 19:15:02 +0800
X-Gm-Features: AclHuK-ZGaxYqXYmXJ3b4_5omqV-rK1XApFuPnTHkxfYrM3u6ZjLmyd_d7Xp8AU
Message-ID: <CAEnQdOq52vUT2gw9SeD=Lo0sf9Oesqs=dLCV1yYK2zrfyW6MHQ@mail.gmail.com>
Subject: Re: [PATCH net v4 2/2] vxlan: reject VNI add when the default fdb
 entry is nexthop-backed
To: kernel test robot <lkp@intel.com>
Cc: Ido Schimmel <idosch@nvidia.com>, Ilya Maximets <i.maximets@ovn.org>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Petr Machata <petrm@nvidia.com>, 
	Ferruh Yigit <ferruh.yigit@amd.com>, Antoine Tenart <atenart@redhat.com>, 
	Seungwon Bae <qotmddnjs@gmail.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Build failure confirmed: vxlan->cfg became an RCU-managed pointer in
current net/main, so .cfg.remote_ip no longer compiles.

v5 uses the function-local cfg pointer (&cfg->remote_ip) instead.
[1/2] unchanged, both dry-run applied on net/main, checkpatch clean.

Regards,
Henry

kernel test robot <lkp@intel.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8828=E6=97=
=A5=E5=91=A8=E4=B8=89 17:38=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Henry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Henry-Martin/vxlan=
-reject-VNI-add-when-the-default-fdb-entry-is-nexthop-backed/20261027-18471=
3
> base:   net/main
> patch link:    https://lore.kernel.org/r/20261027104713.328028-2-bsdhenry=
martin%40gmail.com
> patch subject: [PATCH net v4 2/2] vxlan: reject VNI add when the default =
fdb entry is nexthop-backed
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20261028=
/202610281752.nKGCORKp-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
da436a23e613c425fc9b868fc8deb979ede47a4)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261028/202610281752.nKGCORKp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610281752.nKGCORKp-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/vxlan/vxlan_vnifilter.c:846:33: error: member reference ty=
pe 'struct vxlan_config *' is a pointer; did you mean to use '->'?
>      846 |             !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>          |                              ~~~~~~~~~~^
>          |                                        ->
>    1 error generated.
>
>
> vim +846 drivers/net/vxlan/vxlan_vnifilter.c
>
>    819
>    820  static int vxlan_vni_add(struct vxlan_dev *vxlan,
>    821                           struct vxlan_vni_group *vg,
>    822                           u32 vni, union vxlan_addr *group,
>    823                           struct netlink_ext_ack *extack)
>    824  {
>    825          const struct vxlan_config *cfg =3D rtnl_dereference(vxlan=
->cfg);
>    826          struct vxlan_vni_node *vninode;
>    827          __be32 v =3D cpu_to_be32(vni);
>    828          bool changed =3D false;
>    829          int err =3D 0;
>    830
>    831          if (vxlan_vnifilter_lookup(vxlan, v))
>    832                  return vxlan_vni_update(vxlan, vg, v, group, &cha=
nged, extack);
>    833
>    834          err =3D vxlan_vni_in_use(vxlan->net, vxlan, cfg, v);
>    835          if (err) {
>    836                  NL_SET_ERR_MSG(extack, "VNI in use");
>    837                  return err;
>    838          }
>    839
>    840          /* A default fdb entry that is backed by a nexthop group =
can
>    841           * never take a remote; reject before the VNI is installe=
d,
>    842           * otherwise a failure in vxlan_vni_update_group() would =
leave
>    843           * the VNI half-installed.
>    844           */
>    845          if ((group && !vxlan_addr_any(group)) ||
>  > 846              !vxlan_addr_any(&vxlan->cfg.remote_ip)) {
>    847                  if (vxlan_fdb_entry_nh_backed(vxlan, all_zeros_ma=
c, v)) {
>    848                          NL_SET_ERR_MSG(extack,
>    849                                         "Cannot add a remote to a =
nexthop fdb entry");
>    850                          return -EOPNOTSUPP;
>    851                  }
>    852          }
>    853
>    854          vninode =3D vxlan_vni_alloc(vxlan, v);
>    855          if (!vninode)
>    856                  return -ENOMEM;
>    857
>    858          err =3D rhashtable_lookup_insert_fast(&vg->vni_hash,
>    859                                              &vninode->vnode,
>    860                                              vxlan_vni_rht_params)=
;
>    861          if (err) {
>    862                  vxlan_vni_free(vninode);
>    863                  return err;
>    864          }
>    865
>    866          __vxlan_vni_add_list(vxlan, vg, vninode);
>    867
>    868          if (vxlan->dev->flags & IFF_UP)
>    869                  vxlan_vs_add_del_vninode(vxlan, vninode, false);
>    870
>    871          err =3D vxlan_vni_update_group(vxlan, vninode, group, tru=
e, &changed,
>    872                                       extack);
>    873
>    874          vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
>    875
>    876          return err;
>    877  }
>    878
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
