Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014A8F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676305690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tY93Vcn96S1NQqNiCIPT+HMJd+qoWIAXPg3or3XpE6U=;
	b=VTiZxJ1Sj5laTfve61b8JexkH29qUVaJf4pUs0w7PobB2vrCsfhcNjjRLy96JNEa1+3nmv
	5f/Bv4HfqkuyPd9qkD/PH7DXW0SH6ulzR6qUOu9F4UGkMv3tFiXfoxJnOjM10AKy1deYDb
	Jme+dPbjHdNmoqVPPOlagd0hthl2exA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-tSbErZfjNTuANVaBaHmJOw-1; Mon, 13 Feb 2023 11:28:07 -0500
X-MC-Unique: tSbErZfjNTuANVaBaHmJOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D72187A9E1;
	Mon, 13 Feb 2023 16:28:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0858D40CF8ED;
	Mon, 13 Feb 2023 16:28:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <63ea63b7.y4YY5lB3uDgtlJY6%lkp@intel.com>
References: <63ea63b7.y4YY5lB3uDgtlJY6%lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, Josh Triplett <josh@joshtriplett.org>,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [lkp] [+547 bytes kernel size regression] [i386-tinyconfig] [929bad88e0] splice: Fix O_DIRECT file read splice to avoid reversion of ITER_PIPE
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 13 Feb 2023 16:28:05 +0000
Message-ID: <2341199.1676305685@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2341198.1676305685.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> FYI, we noticed a +547 bytes kernel size regression due to commit:
>=20
> commit: 929bad88e01fe3741170eb3c2faace578fae1ef6 (splice: Fix O_DIRECT fi=
le read splice to avoid reversion of ITER_PIPE)
> https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract-=
3
>=20
>=20
> Details as below (size data is obtained by `nm --size-sort vmlinux`):
>=20
> 4ec5183e: Linux 6.2-rc7
> 929bad88: splice: Fix O_DIRECT file read splice to avoid reversion of ITE=
R_PIPE
>=20
> +--------------------------------------+----------+----------+-------+
> |                symbol                | 4ec5183e | 929bad88 | delta |
> +--------------------------------------+----------+----------+-------+
> | nm.t.generic_file_direct_splice_read | 0        | 515      | 515   |
> | bzImage                              | 495936   | 496288   | 352   |
> | nm.T.generic_file_splice_read        | 169      | 200      | 31    |
> | nm.D.linux_banner                    | 165      | 166      | 1     |
> +--------------------------------------+----------+----------+-------+

How does 82cf0207bed44feb0b3b8b17a4c351fdde34a97b to v6.2-rc7?  That's the
conclusion of the ITER_PIPE-removal.

David

