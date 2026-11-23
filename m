Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450661;
	b=h/0+yEIB86Oo1adF1RRFTddT8eBHzUx+t6N42YJO7TQWHcIAa9qn8nRi9XVT0O9UrsXN
	 x6Nqmkup/q2f1l/yf29EFkXskKhIADUUdLUfclEsKjs5Yapm3kNjIRz61yoQsQWW/wHGZ
	 3TLKbXGK6/a1eHclLEFRWlZToUFlzGHmRaEvdP8I6iiFIGRiPoWx72Xp/xxElMp40hThl
	 OXbVXg9xdm1YcuS4eK4KVPUonWfscaO7UTtd05rPxzlu8X8mK5N1zbBjT0HdhCdwWn2aJ
	 KJsU+ggo52LUCsRMpgQLzbZmFs/3SHUlOlLPy2G4yhw6AlyoMZVHMdeXgEGSjomjkfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450661;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=UdiZ0/pWB3RUl5Gb4cAUadyca+MEgPrH5Z1B8vzEfHo=;
	b=O/5dWraioCFawAr+U6BDrSZcerUFqHJCPDbGrFcGj1a46idOwjWbXKSko6KAMJDI1TtL
	 c4UOEFbnIzBYD5sNH0+hF97CBfo1PwGUejDn2rgyY7zd3YjOChItdvjPnqohSKut8vRB2
	 +rsWlFcRDQ6t9oRuPRf2OdwBlUoH8jjQgySGEstovaWxn7Bksqmvd6V579HOt13raNNN4
	 HxyuypUtzfhvgSnnefZdScBj3obScvebYLT0Y7sWaWxwoDGiN0GSlCuOUp0q0fDZba9l5
	 fHrv0WtaFkOZAcnVBFIMDaVJAeegUnTny5LgI3hqPj2Xoh5wG9O4kxWn8/95NeArYIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jA902MD8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D46606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 16:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D46606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jA902MD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795450659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UdiZ0/pWB3RUl5Gb4cAUadyca+MEgPrH5Z1B8vzEfHo=;
	b=jA902MD8DoF+tilEiJqic6TvudIcDjss1FmsvnHsbN7KZsGtcvH5LrhEf2BAZ5DGGYLhzo
	p8xCzI75BhM0LSlVwbV0+R2RER/WoOFkgQVqyutpeuynJIBr8oZ+L2TA5ai/8vBIQ41XRP
	cAgVZDyjAok3FkG9gxV4OrKHc4nN0FU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-_i6payb3ODyC69eLVRQ-qg-1; Mon,
 23 Nov 2026 16:17:34 +0000
X-MC-Unique: _i6payb3ODyC69eLVRQ-qg-1
X-Mimecast-MFC-AGG-ID: _i6payb3ODyC69eLVRQ-qg_1795450653
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAFCB1944F12;
	Mon, 23 Nov 2026 16:17:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 6D3421801971;
	Mon, 23 Nov 2026 16:17:28 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Mon, 23 Nov 2026 17:17:29 +0100 (CET)
Date: Mon, 23 Nov 2026 17:17:27 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [mic:next 1/1] security/landlock/tsync.c:492:9: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <awRnF6f4t3PYJIHi@redhat.com>
References: <20261123155122.GQ2URc4f-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261123155122.GQ2URc4f-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xRIH8ZHCdF4wJ7GtanVHvISP0m59cx8sK86qcqM1Njw_1795450653
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/23, kernel test robot wrote:
>
> sparse warnings: (new ones prefixed by >>)
> >> security/landlock/tsync.c:492:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *_T @@     got struct spinlock [noderef] __rcu * @@

do we still care about the sparse warnings?

As for this one, we have a lot of ->sighand users which do not use rcu_dereference(),
so I think we don't care.

Oleg.

