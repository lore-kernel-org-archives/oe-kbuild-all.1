Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28A3FD13B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 14:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462832; cv=none; b=KlS3tN6lyI9FFcJnhOHuKm98VGrjRw+CgGrqkYK4M0sAAH3VGjWIyL215clCbh/xrr443zPngr+jM0WtjYbPFU5QYauCxOgsW/a8OwD6htkPYWDZbEAlFDhbiiJVoWzcsLyJZbRaUOwDQNFr9wnwbxN0aMUWvN1KE75a0nr43c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462832; c=relaxed/simple;
	bh=lFaVpBDMVckcopr2zeCg2SsVMYfdP3orDdCTDaWmc/0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=ugMgZPko1Tz6NnslduXsSw3Fw1vCYYTurW3LULBZUC2bdOA7xkHW25ojaBofbQQcTvJNZqhpNl8lJlydMuthR9qM3oG8SxChqvxU3/1CNclKFEsJvE47tlLrxHB0l8d1DS4wx2rwD7HLFTIHzxGQaIS+Lu662OgwjqQUSGXUzZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VOAvUpz2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VOAvUpz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772462830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8ldJK7DOHN6VTwoFTFzdASy/2kR+CmChdK9wuzdqro=;
	b=VOAvUpz2sZGACP3shaq5zAKbHZMzUd1/MUjHM5sTLLkIm9j1AvKzIqI4FdaK59rzNgsdzU
	Ttmm3/fkmZmOEiABNP3KNQmZ2igdSC9i/Ri/pqDHqRC83GT3P0QIQYzmir4LGLyP18zU+z
	9kwYT3cWfSHs3d1gjbrkqhCdWOJTPRs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-1QMJFQ13OEWN9LaEzo9fhw-1; Mon,
 02 Mar 2026 09:47:07 -0500
X-MC-Unique: 1QMJFQ13OEWN9LaEzo9fhw-1
X-Mimecast-MFC-AGG-ID: 1QMJFQ13OEWN9LaEzo9fhw_1772462826
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35DBB1800473;
	Mon,  2 Mar 2026 14:47:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.45.224.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A372519560A7;
	Mon,  2 Mar 2026 14:47:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aaV8D4RTkIrcn6jd@stanley.mountain>
References: <aaV8D4RTkIrcn6jd@stanley.mountain> <202603011243.LsWeX4QE-lkp@intel.com> <1276684.1772450239@warthog.procyon.org.uk>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-next 10/16] fs/netfs/write_issue.c:850 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 14:47:03 +0000
Message-ID: <1439398.1772462823@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -HQhficnpLr1qa1qly88NEDASXUMbv7FGVSKDT_aCCQ_1772462826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1439397.1772462823.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> a1cee75a302b7a David Howells 2026-02-28  842  cleanup_free:
>=20
> But the goto cleanup_free gotos are still holding the lock.

I see it now, thanks.  I'm going to move cleanup_free: and change the end o=
f
the function:

--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -839,11 +839,12 @@ int netfs_writeback_single(struct address_space *mapp=
ing,
 =09 */
 =09ret =3D netfs_wait_for_write(wreq);
=20
-cleanup_free:
 =09netfs_put_request(wreq, netfs_rreq_trace_put_return);
 =09_leave(" =3D %d", ret);
 =09return ret;
=20
+cleanup_free:
+=09netfs_put_request(wreq, netfs_rreq_trace_put_return);
 couldnt_start:
 =09mutex_unlock(&ictx->wb_lock);
 =09_leave(" =3D %d", ret);

David

