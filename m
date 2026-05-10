Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F72DF68
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778428043; cv=pass; b=PRO3Qpf6FUYXWB/iNnKUMF57dRNgr7PjAz9jtCZxUM5eaK8mI+z/yP19Elsx2i5BS2a0mc6YBYkBhkcBM5xEvEwhpk1RkD9IUQBa2QoGm34jSntwAesXjz2zJvPLhTzB8SlDBI6s6gbnzxxK2RbzhqxGV6qalv8QxVFoUwzvW24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778428043; c=relaxed/simple;
	bh=lhY2lNgi8WlM2WwMpazzz39x0Lx/o1MnElliYXTlzBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qGGuXOr+sN0pB6De/3TYC316EVEeBZ3OEGAjjfQqfwT59CgigtTovpkpzgrq4tV6EPVOUJYwMH0F005znA7xpSdlfXrXqLglyslYq2OMrFGb2pRDhby41a2D7DB3qqMXV3T9E5ki3YDJAaxdTft8L2vQ27TO9WXA4m1o68+lSQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSwninua; arc=pass smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSwninua"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-bcc859ac07fso23036566b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 08:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778428038; cv=none;
        d=google.com; s=arc-20240605;
        b=AuxIA4y5mj8bIe57z+XyIpUU40WZ2/fYGuSKflVE69Tjj9gNDxdQ3S7HZqewBI4BoQ
         P9+dNqIK12DaoOQscTFbT4XmAchNZMPhxvLCr1KPsFkrXzi1CaTco0ykFmVsv+irTv0i
         m/3nWm0B1dOu4jONHu8HZUl8I5jsHZB+c9pbOsXtsBzWRwTlHy+OvR2c6CTyc4of+qRz
         Cupt6XBHxq9Y0OI1rA0g3t1jI04fmO2+WPvQ4Y0OqmYQfxqdsYABUo2Rk+smZIVvQkwV
         0L9clfTYrbSnXubQERhQ+IlqF+BH1bki4oTof9eB1P/EINXzi28BLJ8MQK8S1xx7ww/k
         G/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        fh=iH5Z7EoRlKJhwZPDetRkuoyrHwVkdO+LdxbaglUYGng=;
        b=J8kzf8HhRAgBXXszWrEWWEZx7Pc3mPj/fLIgpFS04X1WXIdBQXwhHj1sa2rsc8LAV9
         Wqs4UIZXAsqfgjJgJ1m9iaP/GwLir2hEoccb1ck7fZv+5l5rbTuB7Z0tU2M1ZT2KigYx
         FcAuj9ctc5VT10ZVGPyd80IWDnbBggsow5MDzCG37IyEjtMhKXz/e/wL0GK5zWwVkD3N
         KxQrAxctN+DNsvLGsMtVmOLWTtoYt86vL21OAJkygOkE2nUBOjhWUSzs4YrH8ftvFJGJ
         Hk80m8H7+0K9RiapJtcEQVjUAKlE0oe7Z3Vky54/NCvBnsYFsWvtesi53rsvzWX66uIQ
         rQgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778428038; x=1779032838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        b=DSwninua52EsolKgOlYy2+t6oz4YTHhkmhyG4fMjsbMK2EKEzS/y44x6oD2wS9APO7
         KAMM3tb8qQpPYQdNtlrAitA+8krG/HQ3P1Wji6HWrdqG/38E4c5JbBhbRQiv3pCOMcv+
         1/c57kdlxt98bzBHylSwjBsimozBi5LoaLimGnSbTfjOAYuLm/tvWTlYnhT2xY9s6UX2
         uwCJ5f/2TI0rIcQG1cejKMOGVOyKvSu86RD2lXDkgBZ1Np8JZLfz6t0TB+9lc0s2W5Pp
         pL2JuFWkinqwPRzC3hpgb/r2aFnqnkC5KSJUxpp/+0oy4vmdcayBYNdHw+8XD81hYjS8
         x/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778428038; x=1779032838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhEj/mUqB2u9/ae3N3PSRwZhRlcMwktJBN18e/nk1wg=;
        b=OScQNmgNRuACk1Gdkfn2+628kIFa0pYja6gLI8aEMxwvK/t5jqmdXIXjn9B3hPpwqi
         MgBkkm1tGm3TrsU8TLnQdFuPXkUubygaxsJ2pjKu+dG9DO9U5CidWeHPn6q9uQL3E8PZ
         cLueW4ghimBax+oCA/tl0HKEIY9cg8gr8H+6Jtmt+r+6QNqipqJx3ebEU2CkORRBm+PO
         kBEpR73DfJB/XD5kCvAm6FBDFZJ8o+O5uSqae9YQuPgeXDT2dbk0sLEdkZtLxW//iQCx
         cdA8ZgrxsiGrpEKMZ04QrAEHtVpIBWj4hKl4SIW2fYrA9Phj1FHW6NSW0raFahDvKdSF
         nseA==
X-Forwarded-Encrypted: i=1; AFNElJ8a1EgJfQJzetvgqVLSGfFSCjY7d3DiP3E2ktNiR1GSa/K3vqXEAsQpCkHoTm3j6GTvplZx7tPOsexlXk4a@lists.linux.dev
X-Gm-Message-State: AOJu0YxUa0n+QdJ+fIjxKg9De4owdchZdyFAMt5Ymp+iCN/pXamTSDvS
	jBZbkyGsEWmXp9q2AT/5+obrHvhDz3msLF4WBoJW7F1mn4J0xeSXiDfoQvkz6tmANmsKODvvUxh
	88xr8HbYdTe7oamxwyNu612VhEi6DvNg=
X-Gm-Gg: Acq92OGTmf1t65/MUY81dkVmWHvOnoOlz+yXCgjrLM5QqNPgKZr4ohC0IpArbRPye4y
	qZ9vIf+btK3GH1GAELQa0/k7HEJqEfXRJW/ndCvwA7TrHAN+41odnTLwoERQv0hPUKO+usK3TNw
	dTXs2GS+v5VexWSIQ/hyqHIqU0rlf1zP4b8r+oBsZVXgCdpkfXKmscXWT7q8Ey9Hzud7/P1mBcI
	G46h9Ll4taXxYyqa3yXMrGFrst527Y2XQQPKNHnVJDR4iaiiFJ5r+AkwRvmpGnZqpNgPNVfcUbY
	l1xkYDGO3fOgnI2Hgo7sCSstoaVWaZIFwTN0K4iIis9o
X-Received: by 2002:a17:906:2898:b0:bcd:3d3f:175f with SMTP id
 a640c23a62f3a-bcd3d3f1dd9mr58009966b.7.1778428038260; Sun, 10 May 2026
 08:47:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505192549.74382-1-lucasp.linux@gmail.com> <202605101615.XGX7gOua-lkp@intel.com>
In-Reply-To: <202605101615.XGX7gOua-lkp@intel.com>
From: Lucas <lucasp.linux@gmail.com>
Date: Sun, 10 May 2026 17:47:04 +0200
X-Gm-Features: AVHnY4I5BJ3WUNxvWShvJiYRdsMV2EajZNf_laz8BJg49nA64GiTUogqPkpeJLg
Message-ID: <CAKYXYMRRoMJk2Ztr7R5r-yTmpY-aXcMmJ7FgMPYOF+ozQg7Uwg@mail.gmail.com>
Subject: Re: [PATCH] llc: fix coding style and memory barrier documentation
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I would like to withdraw this patch from further consideration.

Due to personal reasons, I need to step away and focus my attention
elsewhere for the time being. I won't be able to follow up on any
reviews or necessary changes at this stage.
I am very sorry for any inconvenience this may cause to the
maintainers and the community.

Best regards,
Lucas

On Sun, May 10, 2026 at 11:01=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Lucas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
> [also build test ERROR on net/main linus/master horms-ipvs/master v7.1-rc=
2 next-20260508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Poupeau/llc-=
fix-coding-style-and-memory-barrier-documentation/20260510-102311
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260505192549.74382-1-lucasp.li=
nux%40gmail.com
> patch subject: [PATCH] llc: fix coding style and memory barrier documenta=
tion
> config: riscv-randconfig-002-20260510 (https://download.01.org/0day-ci/ar=
chive/20260510/202605101615.XGX7gOua-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260510/202605101615.XGX7gOua-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605101615.XGX7gOua-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/llc/llc_input.c:181:3: error: call to undeclared function 'dprintk=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
>      181 |                 dprintk("%s: PACKET_OTHERHOST\n", __func__);
>          |                 ^
>    net/llc/llc_input.c:194:3: error: call to undeclared function 'dprintk=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
>      194 |                 dprintk("%s: llc_sap_find(%02X) failed!\n", __=
func__,
>          |                 ^
>    2 errors generated.
>
>
> vim +/dprintk +181 net/llc/llc_input.c
>
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  151
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  152  /**
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  153   *     llc_rcv -=
 802.2 entry point from net lower layers
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  154   *     @skb: rec=
eived pdu
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  155   *     @dev: dev=
ice that receive pdu
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  156   *     @pt: pack=
et type
> 74c950c966c180 Andrew Lunn              2020-07-13  157   *     @orig_dev=
: the original receive net device
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  158   *
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  159   *     When the =
system receives a 802.2 frame this function is called. It
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  160   *     checks SA=
P and connection of received pdu and passes frame to
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  161   *     llc_{stat=
ion,sap,conn}_rcv for sending to proper state machine. If
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  162   *     the frame=
 is related to a busy connection (a connection is sending
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  163   *     data now)=
, it queues this frame in the connection's backlog.
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  164   */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  165  int llc_rcv(stru=
ct sk_buff *skb, struct net_device *dev,
> f2ccd8fa06c8e3 David S. Miller          2005-08-09  166             struc=
t packet_type *pt, struct net_device *orig_dev)
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  167  {
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  168         struct ll=
c_sap *sap;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  169         struct ll=
c_pdu_sn *pdu;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  170         int dest;
> 846d7f9be89210 Lucas Poupeau            2026-05-05  171         int (*rcv=
)(struct sk_buff *skb, struct net_device *dev,
> 846d7f9be89210 Lucas Poupeau            2026-05-05  172                  =
  struct packet_type *pt, struct net_device *orig_dev);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  173         void (*st=
a_handler)(struct sk_buff *skb);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  174         void (*sa=
p_handler)(struct llc_sap *sap, struct sk_buff *skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  175
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  176         /*
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  177          * When t=
he interface is in promisc. mode, drop all the crap that it
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  178          * receiv=
es, do not try to analyse it.
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  179          */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  180         if (unlik=
ely(skb->pkt_type =3D=3D PACKET_OTHERHOST)) {
> 0dc47877a3de00 Harvey Harrison          2008-03-05 @181                 d=
printk("%s: PACKET_OTHERHOST\n", __func__);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  182                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  183         }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  184         skb =3D s=
kb_share_check(skb, GFP_ATOMIC);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  185         if (unlik=
ely(!skb))
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  186                 g=
oto out;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  187         if (unlik=
ely(!llc_fixup_skb(skb)))
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  188                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  189         pdu =3D l=
lc_pdu_sn_hdr(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  190         if (unlik=
ely(!pdu->dsap)) /* NULL DSAP, refer to station */
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  191                go=
to handle_station;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  192         sap =3D l=
lc_sap_find(pdu->dsap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  193         if (unlik=
ely(!sap)) {/* unknown SAP */
> 0dc47877a3de00 Harvey Harrison          2008-03-05  194                 d=
printk("%s: llc_sap_find(%02X) failed!\n", __func__,
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  195                  =
       pdu->dsap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  196                 g=
oto drop;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  197         }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  198         /*
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  199          * First =
the upper layer protocols that don't need the full
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  200          * LLC fu=
nctionality
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  201          */
> 23dbe7912dad6b Stephen Hemminger        2006-05-25  202         rcv =3D r=
cu_dereference(sap->rcv_func);
> 696ea472e19c6d Changli Gao              2011-02-22  203         dest =3D =
llc_pdu_type(skb);
> 6aa7de059173a9 Mark Rutland             2017-10-23  204         sap_handl=
er =3D dest ? READ_ONCE(llc_type_handlers[dest - 1]) : NULL;
> aadf31de16a7b2 Ben Hutchings            2012-08-13  205         if (unlik=
ely(!sap_handler)) {
> 696ea472e19c6d Changli Gao              2011-02-22  206                 i=
f (rcv)
> 696ea472e19c6d Changli Gao              2011-02-22  207                  =
       rcv(skb, dev, pt, orig_dev);
> 696ea472e19c6d Changli Gao              2011-02-22  208                 e=
lse
> 696ea472e19c6d Changli Gao              2011-02-22  209                  =
       kfree_skb(skb);
> 696ea472e19c6d Changli Gao              2011-02-22  210         } else {
> 23dbe7912dad6b Stephen Hemminger        2006-05-25  211                 i=
f (rcv) {
> 8f182b494f8779 Stephen Hemminger        2006-05-25  212                  =
       struct sk_buff *cskb =3D skb_clone(skb, GFP_ATOMIC);
> 846d7f9be89210 Lucas Poupeau            2026-05-05  213
> 8f182b494f8779 Stephen Hemminger        2006-05-25  214                  =
       if (cskb)
> 8f182b494f8779 Stephen Hemminger        2006-05-25  215                  =
               rcv(cskb, dev, pt, orig_dev);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  216                 }
> aadf31de16a7b2 Ben Hutchings            2012-08-13  217                 s=
ap_handler(sap, skb);
> 696ea472e19c6d Changli Gao              2011-02-22  218         }
> 6e2144b76840be Arnaldo Carvalho de Melo 2005-09-22  219         llc_sap_p=
ut(sap);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  220  out:
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  221         return 0;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  222  drop:
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  223         kfree_skb=
(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  224         goto out;
> 846d7f9be89210 Lucas Poupeau            2026-05-05  225
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  226  handle_station:
> 6aa7de059173a9 Mark Rutland             2017-10-23  227         sta_handl=
er =3D READ_ONCE(llc_station_handler);
> aadf31de16a7b2 Ben Hutchings            2012-08-13  228         if (!sta_=
handler)
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  229                 g=
oto drop;
> aadf31de16a7b2 Ben Hutchings            2012-08-13  230         sta_handl=
er(skb);
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  231         goto out;
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  232  }
> ^1da177e4c3f41 Linus Torvalds           2005-04-16  233
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
