Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26085A79B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385955; cv=none; b=uKhigWuZqCpqFt/YQSOCxf02X2J8FIHvBWvX42Eyvm1Ee2ThuKrVAhQYQGzMhrJdfO7DRMZHArs4JoQhEX/D3/cLuCGCxDB/hS2Idcszew7Kk3sTFhg6pjm4m1qqBd+txfznSa0glaHM/xXxWDwQFiUTUG8Uqu8HzeH8H71RKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385955; c=relaxed/simple;
	bh=RNj5ePV9FEHTf5RqDHpSwDLdjm11fyJrMYx0C+egup8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=nJRIBPsXg3lYyL6Efqx5w8Qapw7+ENH+t3Lj351wDlhn5KAK65ABDKQA0xY4PSZ5SDI2zOOvkHkk6OIR/IiMGNDdHNu7VE6xsvu4XAbi0+h37FlWVo/YumGlx68x9RwbKoZdTiJmMn2lX3n8oL/c4uNeq/Az+F/hYp1zUamoLiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BLvSxaRS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BLvSxaRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730385952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4tApf6SxUiQvSLRB1CZuH8I2tFQCH51G7RsPvnJaXAs=;
	b=BLvSxaRSIB3Piicst0MQQYHKRe8y8+kgA3ngf2izRydVHZFr7fIKATBv1ZqnCDyJvUNkg4
	zNSzIN3/quUzghB7NejRtt05O6yjSoRsSnaHC2gyM3e87HFDde08N8BqHci8SVC6KLz4se
	PY/vqKeySR9gyJ5F3UjDlRS+lT+1fzY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-hTKI06dBN42WmAyOWhGb2g-1; Thu,
 31 Oct 2024 10:45:50 -0400
X-MC-Unique: hTKI06dBN42WmAyOWhGb2g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64E0C1964CD6;
	Thu, 31 Oct 2024 14:45:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.231])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A39861955E83;
	Thu, 31 Oct 2024 14:45:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202410291037.uzpw7XAB-lkp@intel.com>
References: <202410291037.uzpw7XAB-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, marc.dionne@auristor.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 31/34] fs/afs/dir_edit.c:423 afs_edit_dir_remove() warn: unsigned 'entry' is never less than zero.
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 31 Oct 2024 14:45:45 +0000
Message-ID: <48460.1730385945@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48459.1730385945.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> fs/afs/dir_search.c:155 afs_dir_search_bucket() warn: potential spectre i=
ssue 'block->dirents' [r] (local cap)

Um.  I'm not sure I understand exactly what this is complaining about.

In the code:

=09while (entry) {
=09=09const union afs_xdr_dir_block *block;
=09=09const union afs_xdr_dirent *dire;
=09=09unsigned int blnum =3D entry / AFS_DIR_SLOTS_PER_BLOCK;
=09=09unsigned int slot =3D entry % AFS_DIR_SLOTS_PER_BLOCK;
=09=09unsigned int resv =3D (blnum =3D=3D 0 ? AFS_DIR_RESV_BLOCKS0 : AFS_DI=
R_RESV_BLOCKS);

=09=09_debug("search %x", entry);

=09=09if (slot < resv) {
=09=09=09kdebug("slot out of range h=3D%x rs=3D%2x sl=3D%2x-%2x",
=09=09=09       iter->bucket, resv, slot, slot + iter->nr_slots - 1);
=09=09=09goto bad;
=09=09}

=09=09block =3D afs_dir_find_block(iter, blnum);
=09=09if (!block)
=09=09=09goto bad;
=09=09dire =3D &block->dirents[slot];  <<<<<<<<<<<<<<< line 155

"slot" is limited by the modulus operator to the number of slots in the
array, and the directory block has a fixed-length array of dirents in it:

=09union afs_xdr_dir_block {
=09=09struct afs_xdr_dir_hdr=09=09hdr;

=09=09struct {
=09=09=09struct afs_xdr_dir_hdr=09hdr;
=09=09=09u8=09=09=09alloc_ctrs[AFS_DIR_BLOCKS_WITH_CTR];
=09=09=09__be16=09=09=09hashtable[AFS_DIR_HASHTBL_SIZE];
=09=09} meta;

=09=09union afs_xdr_dirent=09dirents[AFS_DIR_SLOTS_PER_BLOCK];
=09} __packed;

David

