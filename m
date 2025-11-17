Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C2328B7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372049; cv=none; b=oZwdqLmYg5YBZ+H9Sdu5EJkLf6pe6l40op3IYMaMTOhiOTSTZwTnQjnInr3ma1JMyIA4jKAuxGzRIUDCIbWB9KWmf0fTQweSDWHjGrjHytLRxSR5w+RQHXZobsGXur/r1/wH0ILRxEE9la0twF+It7OnfQX02ktx5SsJkzZJNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372049; c=relaxed/simple;
	bh=5/PiAerW/WMHQNuASVUZgIV493gGfzSs+ty4FUXg4uA=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=l0OGkuGAW93xd8RntmrqOCbFMpDvu6+UeVUwKQ+J7aD6Ou+B9HAkZ+qngoa0RFylTjoY/coarUtg2p3aglARiQPenixWW7Ei/kCTL/gkZlXmWBtrC364RfGuB3Aogz5ox5WbpHetWfE+td1mRqXl9t/jGW0PdlsulyPM6R9hSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyZblvxq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyZblvxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763372044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEzfOMUPELQsl5GLyq/7jatn7nLjK/7n42TKt/yRgMI=;
	b=gyZblvxqteJvhcbFcknNFhCBVI+Ba9nISyvKsF/mKBEqutmySaYQJcFffWzU0/cYbx95JL
	Q7Nqe3zXkdIdCl2GLuVH7V4amBxUVMfc9qPE7Kjk10cbU+jcApVupdNZeRUQUVam9OeKnA
	veDYQvYK1jD4Rfqb5lKG7t5iY25huP8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-GEEUH8VLP_qXiBdcpp1CXg-1; Mon,
 17 Nov 2025 04:34:01 -0500
X-MC-Unique: GEEUH8VLP_qXiBdcpp1CXg-1
X-Mimecast-MFC-AGG-ID: GEEUH8VLP_qXiBdcpp1CXg_1763372040
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 75D8A180009D;
	Mon, 17 Nov 2025 09:34:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 648B23003754;
	Mon, 17 Nov 2025 09:33:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202511150746.J2odmFxR-lkp@intel.com>
References: <202511150746.J2odmFxR-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:keys-pqc 2/9] lib/crypto/mldsa/crypto_mldsa.c:218:13: warning: 'dilithium_kernel_alg_exit' defined but not used
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 09:33:58 +0000
Message-ID: <1966143.1763372038@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q01l9IeKHiHUZuWr4jOY5-gZIAauNfuggXlepC20l2c_1763372040
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1966142.1763372038.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> All warnings (new ones prefixed by >>):
>=20
> >> lib/crypto/mldsa/crypto_mldsa.c:218:13: warning: 'dilithium_kernel_alg=
_exit' defined but not used [-Wunused-function]
>      218 | static void dilithium_kernel_alg_exit(struct crypto_sig *tfm)
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/mldsa/crypto_mldsa.c:213:12: warning: 'dilithium_kernel_alg=
_init' defined but not used [-Wunused-function]
>      213 | static int dilithium_kernel_alg_init(struct crypto_sig *tfm)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/mldsa/crypto_mldsa.c:198:21: warning: 'dilithium_kernel_max=
_size' defined but not used [-Wunused-function]
>      198 | static unsigned int dilithium_kernel_max_size(struct crypto_si=
g *tfm)
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/mldsa/crypto_mldsa.c:123:12: warning: 'dilithium_kernel_set=
_pub_key_int' defined but not used [-Wunused-function]
>      123 | static int dilithium_kernel_set_pub_key_int(struct crypto_sig =
*tfm,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/mldsa/crypto_mldsa.c:48:12: warning: 'dilithium_kernel_veri=
fy' defined but not used [-Wunused-function]
>       48 | static int dilithium_kernel_verify(struct crypto_sig *tfm, con=
st void *src,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~
> >> lib/crypto/mldsa/crypto_mldsa.c:39:12: warning: 'dilithium_kernel_sign=
' defined but not used [-Wunused-function]
>       39 | static int dilithium_kernel_sign(struct crypto_sig *tfm, const=
 void *src,
>          |            ^~~~~~~~~~~~~~~~~~~~~

The problem here is one of configuration:

=09warthog>grep MLDSA config
=09CONFIG_CRYPTO_LIB_MLDSA=3Dy
=09# CONFIG_CRYPTO_LIB_MLDSA_44 is not set
=09# CONFIG_CRYPTO_LIB_MLDSA_65 is not set
=09# CONFIG_CRYPTO_LIB_MLDSA_87 is not set

You need at least one of these to be set, but I'm not sure how to make that
mandatory within Kconfig language.

David

