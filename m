Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87872575D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705587336; cv=none; b=RNGMmjqtW6hGnl1qlfSup22sjULxjrdyvEwmgrzJXvcKXApVCZYXbBQinmtbVJ9zMr4+jmQWrFTvurdeKW9X3+9Ksu/IR8jCJrBmlE5kpDNQbJQ4VqGL6HHTEs2eXM5bMWV9c62Ta9XTKooW4yTU669++VLy4Dr0s1F1Hn4A724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705587336; c=relaxed/simple;
	bh=KOoO40rOI3e24A76d6DRdCTmAY8Rh63QKHMoQ3abtGM=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:
	 Organization:From:In-Reply-To:References:To:Cc:Subject:
	 MIME-Version:Date:Message-ID:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-ID:
	 Content-Transfer-Encoding; b=ZG/GzoWxohpQjjb2ks4O0OPGHux6dHdSF7bwlbgGcYUBZURjZ3VGrPzbWRN+CMhMr7beO1DEtPEGZg4dE041FgHHmCg+4isV8fA96r0SXf66Kr0E5QDMKRWP8RNJFyAjilaBqKkpxwmB8im3ULXgV01dbyrEfl/TRQdXEXz3tSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpmQiL03; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpmQiL03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705587333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOoO40rOI3e24A76d6DRdCTmAY8Rh63QKHMoQ3abtGM=;
	b=WpmQiL03viPJXy70cl6ts88IY/3carlwy11fl4sbj58MnmHBkysuY2AUtjcyU1YQLgdUUz
	AFDDaxm/7HL8P40USytoxohkw8G735cQt/JTSe7QlwvWhX4XWpBDK2uH/vpSy6YHHAgAfF
	eh4k5Ltkf7eM8ryDQyBP/v7N/F7+DAY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-L9_yXtwUO_Sc2klgOnKmvA-1; Thu,
 18 Jan 2024 09:15:30 -0500
X-MC-Unique: L9_yXtwUO_Sc2klgOnKmvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B71321C07F3A;
	Thu, 18 Jan 2024 14:15:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9937111DCF0;
	Thu, 18 Jan 2024 14:15:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2b6ee4cb-cc6d-4484-bea3-f60fd9d90fae@kadam.mountain>
References: <2b6ee4cb-cc6d-4484-bea3-f60fd9d90fae@kadam.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 4/19] crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 14:15:28 +0000
Message-ID: <3087097.1705587328@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3087096.1705587328.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> smatch warnings:
> crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4=
 <=3D 4
> crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4=
 <=3D 4
> crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4=
 <=3D 4

I've changed the buffer to be size 5 instead of CRYPTO_MINALIGN and left th=
e
alignment to the __aligned() qualifier.

David

