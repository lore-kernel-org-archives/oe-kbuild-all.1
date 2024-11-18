Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33915534E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731918546; cv=none; b=ikxJ9oc7/mVqNrVTxuztQTagSjsnYV0Np8uP/YkhAzOSI4GmbhoxPPe5P75AWom30UHN3xt/yJW76H2XugCsAY2kWfzkYr0LSZOnbZ304k4zkhXuOrup2cBRkAyiFlPv1hTR9fx/LfQTkEKo6WtWpFV3s4fhc9Udv5b8l6l269I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731918546; c=relaxed/simple;
	bh=4HxB6rNmjiVFSwET2mRiugOgccn0vanXi1mhW4lBw/c=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=EqiHoNg8fF09F7gdVVM9pcuvmvHtoRKMfr7m9n9HRSM2QnpV3VEjp/wOOtRKGv8jMJZwxJUG5MbO997qdsZRjWVOVRBo/XaBAVQoe33emZg7eQMWQ0uwziycmnI0MUaJCXzVXmSqriE3Mbbg0GZO1aRaEqTviVe213VX9XceMdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiXPzEU2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiXPzEU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731918543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KPyB1uofqWc5yhWaLIutxD85oyQPPHKaAA9uxwDrYQA=;
	b=AiXPzEU2zD+1bOyknlxSDg4EcFtfwzTfwbh22T/T5xxzRiVBHRvMBm/az/ulHDvxaxCOpM
	iTMcjDX2BIfmzRoo8xUKAzEc4SxqBBNWswd07ZNeTrTyBz6Zbs5PhjoQl7wT2AGFJxBlE+
	skBRjWjlUd8m/S3R61E9j6as/xHYUp8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-Y5p2GVowMWyTDR4c89aSPg-1; Mon,
 18 Nov 2024 03:29:00 -0500
X-MC-Unique: Y5p2GVowMWyTDR4c89aSPg-1
X-Mimecast-MFC-AGG-ID: Y5p2GVowMWyTDR4c89aSPg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8CC7194510C;
	Mon, 18 Nov 2024 08:28:58 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A26E8195E480;
	Mon, 18 Nov 2024 08:28:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202411180534.SsXzA2kZ-lkp@intel.com>
References: <202411180534.SsXzA2kZ-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:rxrpc-iothread 63/64] ERROR: modpost: "__aeabi_ldivmod" [net/rxrpc/rxrpc.ko] undefined!
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 08:28:49 +0000
Message-ID: <818807.1731918529@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Mf9DQcowb-d8WsZLkw29ojBR2wdm3j_ZCEWhpWbimE_1731918538
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <818806.1731918529.1@warthog.procyon.org.uk>

kernel test robot <lkp@intel.com> wrote:

> >> ERROR: modpost: "__aeabi_ldivmod" [net/rxrpc/rxrpc.ko] undefined!

I think this must be due to:

+			trace_rxrpc_resend_skip(call, tq,
+						ktime_sub(resend_at, req.now) / NSEC_PER_USEC);

I'll switch to ktime_to_us() and move it into the tracepoint.

David

