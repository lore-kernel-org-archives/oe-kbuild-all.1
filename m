Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567253128B6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743092; cv=none; b=jZKTEGVrDAWbi/EnvMimQZL0ixr77d1BMr4Kpx2M0OMFCIXmbaHcFe2ELW3AKGRn+1P5OXcxYrQOjs9W2VxWkXj6RKi+XHT4Afee3HoIi+jnUI//DHX0laophHUSqUl04R8TKLwZ+rKr4qsxeJG/ljOWE+sZgE10YC1r6Fd6juQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743092; c=relaxed/simple;
	bh=mXh8MFqck2Dz2/M1ygUZJJIs00bo1w/Vvt3fNSq8M0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OmQo8UtE8cufhDru564eJ9gTxd5Z9QKURUJBGwKE/zNZrExGuLD9xaJAbA7T7oxOFdMH0SzVw1ZKsDWYjR0PO93j3+dEI4P0oStLF1i/55U+Auc+NDxud1IRYgmsZPwlrRYOC9yjX1aUXE065JOIcjLFITfLkUxvAnoL4ra20EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5DTlQC1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5DTlQC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785743090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mXh8MFqck2Dz2/M1ygUZJJIs00bo1w/Vvt3fNSq8M0g=;
	b=F5DTlQC1v+zVLR6LDTLnRY042u5e3eigU+Dyx522ut6dPAoPFE2VVvjzGXmb5LHmScOj0S
	9Ahe7Q7GKEjZh2W8pJSslVu1LRNadR2QLojhNw81mseG3A3ceHiRw9N3U02inKjiCTZHIe
	d1vD6QyOCiJQ1YnCPSNVAq383fOl3Us=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-P6js8KHOPZCdcxh4gk9ieA-1; Mon, 03 Aug 2026 03:44:48 -0400
X-MC-Unique: P6js8KHOPZCdcxh4gk9ieA-1
X-Mimecast-MFC-AGG-ID: P6js8KHOPZCdcxh4gk9ieA_1785743087
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f83416551so3018157f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Aug 2026 00:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743087; x=1786347887;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mXh8MFqck2Dz2/M1ygUZJJIs00bo1w/Vvt3fNSq8M0g=;
        b=Dm2EBhsttf2OYRVRXicEBakfh+K970sFsI6tpzj7/FWReVOca1wepL5KBbejb1NWGr
         SpxWaodiwcSVZtltiSo8OuhG7+duaODWWNgHgZx6GY/5zjI1Ea0DezF2RIxQUhhweToF
         jAWeGS2ggsDmNaxaKeK8kmNz9rQ2DIUwWjDChcvFMlWRcMXH9VMqb+kn3LC/cB9vuoUJ
         ve3skpaykvLEmabgrwsPv6al9el0fkVOvsaW4SkGJcXXAwdnWKw5etUhxExOjulGNbg0
         DeNxnPXv32o8e9Us74qgdcJeN75zjIYtiuNpc8+0diWgthaMGKOJdxd2gIHhX15ZYkgS
         KvDQ==
X-Gm-Message-State: AOJu0YzjtvoibrHXHF+rQMcf8Y3Y9/aP0cvU0s+wHA55ieEpFko6oMPM
	nC6RGr1I7/2GwMxoOxL8k27g9j9sawqueUFQQy5O1OgZKbi1LuMc1xptDsGF9vU1sgzkBrB2lqu
	UuwzUA62oL66tY0SKDoypkBVIKQ8tm3K96jWOGt1MngAwPcriKgdlKjqrsvOsPzNicNU=
X-Gm-Gg: AR+sD10gWgk7ZxUzLXtTRb7Di+1YsyRfNItxmIZ0AllEWveB1/DZKn2/8c8yjY6AmJA
	57BLNbCgjjx4gSoq1sSnDrg11Q0w+aqcppY7PNP9cbR5d9hs48ebdQ5BvqUeC1okEU0gBXMuXd+
	aFSzDAPidhYNqZpd3xN/1pHMJ10JCI1R3Ek9ZmMih9GaPu28gTZdHl05orRlBCU/YFtdYtfiskl
	QMVKkwOyJGhpvcY3hFdX7sMlZTgBEopyfgHPllYoBIQgAnuTSdsJmKxXTx1PzIP82s9NqjpRE3u
	4baRMJ6AlKY3NNyNWAuyfBYUq0Z0jAC5L3TOG46fm2l+mL1WIsjU1Tj1sbamFjw8NU2uW+SBGet
	hftrzrKZD0nZO3xgQSEimo8RAAwAm
X-Received: by 2002:a05:6000:2910:b0:47f:96e6:6e3 with SMTP id ffacd0b85a97d-47fd72c2526mr23041516f8f.23.1785743087562;
        Mon, 03 Aug 2026 00:44:47 -0700 (PDT)
X-Received: by 2002:a05:6000:2910:b0:47f:96e6:6e3 with SMTP id ffacd0b85a97d-47fd72c2526mr23041470f8f.23.1785743087207;
        Mon, 03 Aug 2026 00:44:47 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458bb4esm29441221f8f.30.2026.08.03.00.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:44:46 -0700 (PDT)
Message-ID: <1cf3b00f0b1d5fac0ea07a7269f05fe8fdafd726.camel@redhat.com>
Subject: Re: [trace:latency/for-next 33/38] ERROR: modpost: "__udivdi3"
 [kernel/trace/rv/rv_monitors_test.ko] undefined!
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Date: Mon, 03 Aug 2026 09:44:45 +0200
In-Reply-To: <87cxvzofkg.fsf@yellow.woof>
References: <202608020311.hYjqOG5k-lkp@intel.com>
	 <87cxvzofkg.fsf@yellow.woof>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0exm_z0RhmlQUMsZzQnGYyG0rJ4S8wvOGsiyPhaDsYk_1785743087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-08-03 at 08:58 +0200, Nam Cao wrote:
> kernel test robot <lkp@intel.com> writes:
> > tree:=C2=A0=C2=A0
> > https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace=C2=A0=
latency/fo
> > r-next
> > head:=C2=A0=C2=A0 984b5a36fd12d1849511a45fda32036fe2b0d004
> > commit: 8da2a88383658dac97769ed8f807ef6100a69480 [33/38] rv: Add KUnit =
tests
> > for some DA/HA monitors
> > config: i386-allmodconfig
> > (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k=
-lkp@
> > intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=3D1 build):
> > (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k=
-lkp@
> > intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion
> > of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202608020311.hYjqOG5k-lkp@intel=
.com/
> >=20
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >=20
> > > > ERROR: modpost: "__udivdi3" [kernel/trace/rv/rv_monitors_test.ko]
> > > > undefined!
>=20
> We could switch the division to div64_u64(), or we could change
> deadline_thresh's type to u32.
>=20
> Gabriele, can deadline_thresh fits in u32?

That would make it limited to 4.29 s which is probably way more than enough=
 on
normal systems, but this limit would be driven purely by the KUnit test, I'=
m not
fond of that.

Probably the best thing here is to use div64_u64() (or even do_div() though=
 we
don't really care about performance).

I can send a quick fix.

Thanks,
Gabriele

