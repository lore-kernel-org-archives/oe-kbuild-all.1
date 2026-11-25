Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600817;
	b=tc9Rvju9gye50ixZQV9uLJEvOyzltvurRSijJNBDD4/OcfvXL41cdEwErH4hPjQjeGii
	 l7id7CRdaK9nT3DfMIQ58fYr1KNXXLer3xeonZGe48qANdS/rHrEVq/7ZMa6KN3HHNxK/
	 Do1SzBSnODyiR5T/uF7SN29FG2kN49intRHL8bzXD+hNCWLXQWeDy82prH6P8psw1T4qW
	 Jxqou67gPnd/JD8N+9/wlzEhB4IRAlRKoIcNVpZoMSmHGBwZNnWGwXpSBGhnlTxNmGPBz
	 rB7eb43DGXyfq36KZZIG4bO5FcbBn4elzH9f1UO74rbRBeTtQdRlLbXZGcFdd4m560g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6Xv5qPmm0dHiJb1NJzGm83vzcGRgH+0sehHVb5Pqb2I=;
	b=D0+OIqfRImeY8+Sc4Rc2dws97228uWc7qzGgdjHvxmw+9qV//VzfUqjiC6qexX8+dH9t
	 b0t5GK6R+NXAdEudpOQdgvQGM4oVshd9spx3TFl+SmGg4EhT9xvNWnsfKfeFHFhnx4cyB
	 OHRFEJgFVEwgC8L7/0mVpReGh24pmrq+o6yiUGeruV6GMdy9T8QRgZ+IVdKl+2AH/IU15
	 /wVRuMhNOFCa+L6NuENUZbykml9BZ7q42zzHzO5Tk7WoWH75crbaF9kSbcK5Y1sqd+wnc
	 6bn0NhgNjdwWwa3PDw1in5IodzBc+uI84ubJU/dFR1wCt6hgS+wYJOrmM6mKfqy92aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdWZnU1L;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D1606A333
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52D1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xdWZnU1L
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492690dd5daso4200990f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795600815; x=1796205615; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Xv5qPmm0dHiJb1NJzGm83vzcGRgH+0sehHVb5Pqb2I=;
        b=xdWZnU1LfsAQMASARSqO9IgP+kejuZkv9n0olIkg0HPmgxl43wf26O67gGvxcN25Bk
         Al9h9xof1/drZ9eV5TbP9AexEDrV59dPIEris6qiEnNcHgrpLkakud/BVs7k/jVycboA
         xfJe78ZRbXKio3l+mCWsKx4TbbzktEWujrRyqUD8TwvAhYXT0wEMoMgC3Iie/8GtKK4b
         +VbNDcsOwX0VBt5jWCBhmi9cjGWPWjqSB6ZvOrEUTClnn9MZjhs8hEZLmchWKXdIkum3
         78o5p/DPp2FFN754gm6rzcNDk63ZTInI3igjnOgb9Jc01U4+dccu75bYVFU7nvZy/yjT
         hx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600815; x=1796205615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Xv5qPmm0dHiJb1NJzGm83vzcGRgH+0sehHVb5Pqb2I=;
        b=A6xTjDbRUrY30ZO+WhfFm/LCffE5bv3n9WBCHrZWYzgbUC7tMm9qC1DkHiKLsGA//d
         jEkPyjEpuvx1HMBTsRTEZ2IQsxv+H2vPbqMRcrwH19emljySAEPxy3Gjx4WUn86WyK2P
         a62zq6MZdYEgmZ2S1KhuS1FnMJEUDp/vhKpATkZowK0nPNVtcaNqwRyR0xB5F/NNa8qS
         QXckVwlw6J1OrpEL6M+9h1OSo+8P1nL7U/muA2sgi8M1BdZ6loLz3WSrWtZXYdwMB3pp
         9PsM9eh2ibOEuLIo8dpdcAYCBXcu7DkGSvAGB5qeNJyuHL5NzZm/cDUDUE1ukBQBcaV6
         eUzw==
X-Forwarded-Encrypted: i=1; AL+hErGiiA6jfInQdIAbHp6/lIMH2CEK3Xlw10KdFoG8pgbPeVCwPtc5eyrl77gxF6zQihyg9TLzopfvMSr8vt7T@lists.linux.dev
X-Gm-Message-State: APuU4Z+SECqNgSI1wU4TYBfI4B1vQ4rvflODkHgiylAvaMO7EjGGi0uJ
	1Bc6zXdqsZMujdJ5R8A1mhOcIs02g8Z2bnmVFxG8h4gsa1lovh7gV04J
X-Gm-Gg: AZFdTZc0nX4JqgJoj+r5HQC9lO1qlLi35HwAOSKtdzXJ5wpmVgkR1qNUQH1/kVRySxu
	UkTj6O4o7bL12Hc05iKjR9rkkP9ylP2mIQYk+GwoTFr58AvnmUiXHjD+WdLC7MP5xzTiYVtAw4E
	vqH9uJfYSmKG9ladQP+Dj/lI83p6vK0B42VBjV9HRXO3Z4OUGiGmnQWO99exCLCyhwi3HrJ6vL6
	dD5f7wKqMcFC0mkCH4UIG/JhpGJpeWqzOPAZmW/QPmF3swfW21kMuCTWu27NGjx9SUZaHPUfgw3
	wkAWNAc3MrBDVBg/6665EjIcf22UVXWMzmg+XiMMur/DSflYt6ZiIzdsYkDr+Bj6IHGbdh1RxsQ
	FdGnkaZ+TcQgCJX7VrqhlxumaVlP4zyGeeNmyNF277W8TX1aMP4PZ0lfWNY7Ej3+9oBRoM1I3gF
	iBR6UDh65fnDIz0zwgnwmXeV7+PdTWWxZmpzrenMECI2sb5yY1YN7elvrmT5yzr82yUtutVkztV
	dtBX8AA1QI4RJYk8A6cj1N0rB8XINqgj6VxIBgwY5LOeWyOIRzZmpP6y3qoGn/IAEdfOoQrK75y
	5G1v8vRzOmClWF6H6m8xPnuoOyXiQRwCCV8zmGBoTzM/03d8ChsAi8GPuifHw+VuLw==
X-Received: by 2002:a05:6000:454f:b0:48e:6419:ddf2 with SMTP id ffacd0b85a97d-4abb2168ec7mr22189006f8f.17.1795600814661;
        Wed, 25 Nov 2026 02:00:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm30001376f8f.17.2026.11.25.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:00:14 -0800 (PST)
Date: Wed, 25 Nov 2026 10:00:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Finn Thain" <fthain@linux-m68k.org>, "Bart Van Assche"
 <bvanassche@acm.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>, "kernel
 test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>, "James E . J .
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>
Subject: Re: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
Message-ID: <20261125100013.356bc7c7@pumpkin>
In-Reply-To: <f0ec2845-245d-43ac-9c96-242e0d1d11ea@app.fastmail.com>
References: <20261121034304.2dPxVKzk-lkp@intel.com>
	<0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org>
	<CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
	<669b9ce8-bb33-f7ee-1087-88c1e9d3b610@linux-m68k.org>
	<8a0f78e3-5483-42a2-ae27-473bbb6de915@acm.org>
	<85e103fe-acca-0880-1be3-cb1e7f79f9a4@linux-m68k.org>
	<f0ec2845-245d-43ac-9c96-242e0d1d11ea@app.fastmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 11:18:19 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Nov 24, 2026, at 04:31, Finn Thain wrote:
> > On Mon, 23 Nov 2026, Bart Van Assche wrote:
> >  
> >> On 11/23/26 3:05 PM, Finn Thain wrote:  
> >> > Yes, two alternative solutions were submitted in March (either remove the
> >> > assertion or rework it). The build bot reported the problem again in
> >> > September so I resubmitted the "rework" alternative. Sashiko-bot didn't
> >> > have much praise for that*, so now I'm leaning towards the "remove"
> >> > alternative. I have been advised to keep re-submitting, and I will do so
> >> > after a suitable back-off in retry rate i.e. 2027 or 2028.
> >> > 
> >> > *
> >> > https://lore.kernel.org/r/93e35f60-e465-7f76-0043-f997fe2ec8c7@linux-m68k.org  
> >> 
> >> What an LLM came up with after I asked it to fix 
> >> https://lore.kernel.org/lkml/202603030747.VX0v4otS-lkp@intel.com/ can be 
> >> found below. One of the comments of the LLM is "This is essentially Finn 
> >> Thain's "Rework BUILD_BUG_ON() assertion" patch with your two review 
> >> comments from this morning applied". Sashiko reports "No issues found" 
> >> for the patch below. No Signed-off-by from me because I think Finn 
> >> should be credited for his work instead of I.
> >>   
> >
> > Thanks, Bart. I'll take that as a vote for "rework". There is an 
> > associated risk though: I can't test the patch as I don't have access to 
> > suitable hardware. (Perhaps someone with such access will volunteer.) 
> >
> > Whereas, the "remove" alternative doesn't require testing as it doesn't 
> > risk a regression.
> >
> > I have a question for your LLM. Sashiko-bot said, in response to my patch:
> >
> >     Similarly, get_datalen_for_atio() accesses the array out-of-bounds 
> >     when len > 0:
> >
> >     drivers/scsi/qla2xxx/qla_target.h:get_datalen_for_atio() {
> >     ...
> >         return get_unaligned_be32(&atio->u.isp24.fcp_cmnd.add_cdb[len * 4]);
> >     ...
> >     }
> >
> > I don't understand why the patch from your LLM did not raise the same OOB 
> > access concerns.  
> 
> I suspect that is just from Bart specifically calling it out in the changelog
> already as a known limitation "Do not modify the memcpy() call in
> qlt_queue_unknown_atio(), which still writes past the end of the 'atio'
> member.".
> 
> > Adding a flex array to struct qla_tgt_sess_op can prevent new struct 
> > members being added in the wrong spot in that struct but can't prevent new 
> > struct members being added to struct atio7_fcp_cmnd. Neither does the 
> > assertion. So the "remove" alternative doesn't have all the disadvantages 
> > that you might expect.  
> 
> This is probably just a difference in perception: atio_from_isp and
> everything inside is clearly marked as a hardware structure that is
> meant to align exactly to the 64 byte cacheline, so it would not
> make any sense to change its layout and add more members here.
> qla_tgt_sess_op on the other hand is clearly not a hardware structure
> but an in-kernel one, so it is quite unexpected that one of its members
> extends past the end, especially when the other three instances of
> atio_from_isp in data structures don't seem to do that.
> 
> >> @@ -227,7 +224,7 @@ static void qlt_queue_unknown_atio(scsi_qla_host_t *vha,
> >>   		add_cdb_len =
> >>   			((unsigned int) atio->u.isp24.fcp_cmnd.add_cdb_len) * 4;
> >> 
> >> -	u = kzalloc(sizeof(*u) + add_cdb_len, GFP_ATOMIC);
> >> +	u = kzalloc_flex(*u, extra_cdb, add_cdb_len, GFP_ATOMIC);
> >>   	if (u == NULL)
> >>  		goto out_term;  
> 
> While this does make the current implementation more correct by having
> the correct length, I'm worried that it just ends up establishing
> the complexity more in the sense that extra_cdb extends both into
> the padding and beyond qla_tgt_sess_op.

Isn't the struct also embedded in the middle of other structures
so can't end in a flex array?

> If the driver is still actively maintained, it would be nice to
> reduce the complexity instead, in one of two ways:
> 
> a) make atio_from_isp naturally aligned by dropping the bogus
>    __packed attribute, so it is actually at the end of qla_tgt_sess_op
>    as the driver was written to expect. Note that having the
>    outer structure as __packed but the union and the inner
>    structs as aligned is itself problematic and can lead to
>    undefined behavior, if some code ever takes a pointer to
>    one of the inner aggregates and expects it to be aligned.
>    The only effect that I see from the __packed annotation is
>    that it forces expensive byte access on dma-coherent memory
>    despite it being fully aligned.

It looks to me like almost all of the __packed in that header
are bogus - there is one on an le64 member which could easily
be on an odd 32bit boundary.
What it really wants is an 'error if any padding' flag.
(And maybe a compile-time check on the longer structures.)

If the hardware does dma onto those structures then you really
don't want them misaligned either.

Bag of worms :-)

David

> 
> b) rework the driver more broadly to never actually do any
>    accesses beyond a struct boundary and make it work with
>    sanitizers enabled. One way to do this would be to
>    have a separate isp24 atio structure that is not in the
>    union but that encloses the actual maximum length.
>    Not sure how this would actually be done, but it appears
>    that the current design keeps causing problems, see e.g.
>    091719c21d5a ("scsi: qla2xxx: target: Fix invalid memory
>    access with big CDBs") which adds more complexity around
>    keeping an extra copy for it.
> 
>       Arnd
> 

