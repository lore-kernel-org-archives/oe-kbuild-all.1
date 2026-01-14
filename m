Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516D1314A6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 17:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413088; cv=pass; b=TTZSYHcvXmzhNcVQdvc9KmoVOo5lgn1oXKlPO7ijpu4iZ5+oKCFeZWEYGm3N/WnUTL0t1rLYzGxIUupXXacdUJ8M9TqxviHq/aUhmqSGG444Lf/UPxhCHN/MHE0tMk+jmw0tdx0RraqsJp7xOxRn02sjwnShiWgrbPzIE+0OIVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413088; c=relaxed/simple;
	bh=Ea7o+KQGl+tzpl7hrxsPWv5ZCyV/qNx3woFywRB27Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/YlewGjKt9WR45+UYXFRGtrtrjYq8LQK55vjFnzdY8Zwm99+n8qSaEjU7amZfUEPikKVHXXaFULikHbXLWsVI6F6Y0rePTrYAIoTjFODa1S3vcrfEYJsSCf4Y3MSmYqDOhWGWAE+BhJNtaRlPRhDjMLLaQXz1Z34UON4T6f24Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nu7WUlRE; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nu7WUlRE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d06cfa93so705ad.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 09:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768413086; cv=none;
        d=google.com; s=arc-20240605;
        b=bODbMfzHPzk4dB4O4zR8qGMjDGmUej18CjK6bqMcKu6tQ7q/ldW7eBrccKgbtKTphG
         4qwAAoCvRa2/9bae4gBz86bbC4bRVwsnLqyNOAV+V25m7vTPWN2zPRqzXmbchebTSOPn
         sNSc5BzVGca+ZHXjKvf4lqSnl5b4YBrDV3VOCHCDl3XON8RNqe0ztyEw6UjGY9kOj1kp
         yKou6YqAGuaThOZEGCfVyZsRnhoQhT4gSAuvmcvJ9bNyAivTIvbABHIbhRpQY9COAWR6
         ns5zF8NkW0jqVFS6XG0+X/h5wbtiwyjAR98NLjTrjP5r6jiA0LM1mc0qIMP//xvbc6sh
         yT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9O8qr6iouehIXc4eTCnKI7nRWSb37N39YpAKkNY0YSs=;
        fh=uYS9ZeEICY/lyREWVgVyXFrnLuRwaArp9x4t8o2KMVk=;
        b=Rn1ERClaHOa2NYJtUFWn+T0Tr8joNq3ue+Zx79QuIbWhU8bUP7axBUjY4aCsYkUZbe
         kqfBB8jlc8hb2ekL1ClH+9mLt56KVsMOyncqK0JZSiaVbgpoRAhft00CO1p1KQsiKesS
         UJTD7/9IK7ybPo1bOXt1dhfOU4QKzDQ6OMGJivhBeNyQ8q7MmqnHw0eW+EEblw7Lng4U
         ju3V6hLkm8YM1Mst+umsYPrNrwkStHTBDDAf7E0Pv8MRjcr8YFYOQMwgq1zpZvGexpd/
         S0J9T8Y8LLhcKfZ7gs2I4E8TD52QNLzLyJmUYhgr3bz1FBF1x9uOL69wR2+M1j7Ddl1Y
         Yj/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768413086; x=1769017886; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9O8qr6iouehIXc4eTCnKI7nRWSb37N39YpAKkNY0YSs=;
        b=nu7WUlREge5noBOh2v6JnOSBv3lafpSNx7aPKJn6Hmz1YIqbg3n30C1e72CJmri3RW
         eekbku7rUwOvXYGEglD/YhySXMph9XnoIQb/soaWaVfh6CPq7Q3G/sF1Cnf88z4Z0sxd
         QHHSmeaqeXo8Uy7coBFp7xQJrkLz5/j/w6cmfJJsMH5eFXoE8qLFdKxIU1qruIncCHe4
         npbotZCl7nSfV+66xXqdthodQv8jrGYXsqUIdTWCJFIJ+1WBmrSigYynHF95B6cwaJgE
         kjlE8LsuAcGkHL+4SodrjskE0gGXCz1My0AucGw9QFM9AtcZgkNGyPtTmzg7aFeW2t/f
         CIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768413086; x=1769017886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9O8qr6iouehIXc4eTCnKI7nRWSb37N39YpAKkNY0YSs=;
        b=i3wgJ4cYZhyodQ/ftYtZZu5K1GSLPdzE50H8fR2gH3gaBn/iKbGH78PiXzJSW9gznO
         RO6/rK0p9DKUXbm/zgbmBUEW5/n72N+WFZzV0FY351MOdmh0ofK1hKSAbsW7rQ+YyG7h
         AxwNnbZBNcX6bgYPXp+f+bUb5TxxCrA4kppbgWs/dQ/kbFw6IhUmzdFcgg3WnLeuFU6C
         xNbK5ixDEsYIvxorb/HQHAjL055w8q7JEuoj/iS86PwH9G+UYZe1WPrmTFyTHsoKEF1l
         51P+plOe5PVoYVHN6wUKLishOeD4XW8UjOhZ6q8nFc+KlaKpiszgEAurELl5IuSD39Xw
         MgvQ==
X-Gm-Message-State: AOJu0Yz72PeQQriWm0PkmWIsfERI8JRdJkVQ61MSJS00uLnVbJ3C7j49
	oA7DNe2GK9S5etTMdgMX+r2c4L9hY87URn8TCFiein8u/q07l1/JgFqF+DZ+XGpte9vAV5DNUAl
	DzKLGGp4sfgLxXXWAnVfCyM8tUmmNe7VfjX2jnjtq
X-Gm-Gg: AY/fxX4bOWaHt9KIWeNKnsqvzdYHPtOHQp0VA02d+wVV+s4yaGgwgadxmJ3FXjCQWqh
	8COYDUAPZE/cvctMx1UxpBrDiYYdH+xaAQXXNz9D9FQP0giEYaA3MeOQuQzEurQcggO8fciAfKs
	Nw6umkz0wccyrrGwkxDUzJqeVf3q1rEFQDEf23BWRTccpIEDpDt8WZBElQBaCSHLF073ZjjiUD7
	27O3D5ituRqezfe/yJZOquIJKYz+SQ+QudrNtnbazloi95OFLF4WcKJ5BKoR1dIvYd8hlOyuEQ0
	gJzCY/RBGwns3DACtHJIt0o0vQ==
X-Received: by 2002:a17:902:ce92:b0:29f:f71:a3b9 with SMTP id
 d9443c01a7336-2a59a919e9emr2866575ad.5.1768413086099; Wed, 14 Jan 2026
 09:51:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601150001.sKSN644a-lkp@intel.com>
In-Reply-To: <202601150001.sKSN644a-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Jan 2026 09:51:14 -0800
X-Gm-Features: AZwV_Qirgy_tNLFZB5D22Lt0tzIfiObKXz-CfYxFCmkkQaAMvgA-zRzD628DHTU
Message-ID: <CAP-5=fUyAtf9PQqYvagByK+-=-mN-T1zuLmxuvsPFVVHT3qLXA@mail.gmail.com>
Subject: Re: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 8:37=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timer=
s/vdso
> head:   759a1f97373f25770cf438d9fb5f2bddf4d77a54
> commit: e04a494143bab7ea804fe1ebe286701ee8288e4a [12/14] vdso: Switch get=
/put_unaligned() from packed struct to memcpy()
> config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/a=
rchive/20260115/202601150001.sKSN644a-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260115/202601150001.sKSN644a-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601150001.sKSN644a-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> net/rds/ib_cm.c:96:35: sparse: sparse: incorrect type in argument 1 (d=
ifferent modifiers) @@     expected void * @@     got restricted __be64 con=
st * @@
>    net/rds/ib_cm.c:96:35: sparse:     expected void *
>    net/rds/ib_cm.c:96:35: sparse:     got restricted __be64 const *
>    net/rds/ib_cm.c:103:27: sparse: sparse: incorrect type in argument 1 (=
different modifiers) @@     expected void * @@     got restricted __be64 co=
nst * @@
>    net/rds/ib_cm.c:103:27: sparse:     expected void *
>    net/rds/ib_cm.c:103:27: sparse:     got restricted __be64 const *
>
> vim +96 net/rds/ib_cm.c
>
> ec16227e14141e Andy Grover                  2009-02-24   69
> ec16227e14141e Andy Grover                  2009-02-24   70  /*
> ec16227e14141e Andy Grover                  2009-02-24   71   * Connectio=
n established.
> ec16227e14141e Andy Grover                  2009-02-24   72   * We get he=
re for both outgoing and incoming connection.
> ec16227e14141e Andy Grover                  2009-02-24   73   */
> ec16227e14141e Andy Grover                  2009-02-24   74  void rds_ib_=
cm_connect_complete(struct rds_connection *conn, struct rdma_cm_event *even=
t)
> ec16227e14141e Andy Grover                  2009-02-24   75  {
> ec16227e14141e Andy Grover                  2009-02-24   76     struct rd=
s_ib_connection *ic =3D conn->c_transport_data;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   77     const uni=
on rds_ib_conn_priv *dp =3D NULL;

Here dp is a pointer to a constant value.

> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   78     __be64 ac=
k_seq =3D 0;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   79     __be32 cr=
edit =3D 0;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   80     u8 major =
=3D 0;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   81     u8 minor =
=3D 0;
> ec16227e14141e Andy Grover                  2009-02-24   82     int err;
> ec16227e14141e Andy Grover                  2009-02-24   83
> ec16227e14141e Andy Grover                  2009-02-24   84     dp =3D ev=
ent->param.conn.private_data;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   85     if (conn-=
>c_isv6) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   86             i=
f (event->param.conn.private_data_len >=3D
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   87              =
   sizeof(struct rds6_ib_connect_private)) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   88              =
       major =3D dp->ricp_v6.dp_protocol_major;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   89              =
       minor =3D dp->ricp_v6.dp_protocol_minor;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   90              =
       credit =3D dp->ricp_v6.dp_credit;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   91              =
       /* dp structure start is not guaranteed to be 8 bytes
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   92              =
        * aligned.  Since dp_ack_seq is 64-bit extended load
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   93              =
        * operations can be used so go through get_unaligned
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   94              =
        * to avoid unaligned errors.
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   95              =
        */
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  @96              =
       ack_seq =3D get_unaligned(&dp->ricp_v6.dp_ack_seq);

This is a warned about get_unaligned reported here.

In my patch:

+/**
+ * __get_unaligned_t - read an unaligned value from memory.
+ * @type:      the type to load from the pointer.
+ * @ptr:       the pointer to load from.
+ *
+ * Use memcpy to affect an unaligned type sized load avoiding
undefined behavior
+ * from approaches like type punning that require -fno-strict-aliasing in =
order
+ * to be correct. As type may be const, use __unqual_scalar_typeof to map =
to a
+ * non-const type - you can't memcpy into a const type. The
+ * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
+ * expression rather than type, a pointer is used to avoid warnings
about mixing
+ * the use of 0 and NULL. The void* cast silences ubsan warnings.
+ */
+#define __get_unaligned_t(type, ptr) ({
         \
+       type *__get_unaligned_ctrl_type __always_unused =3D NULL;         \
+       __unqual_scalar_typeof(*__get_unaligned_ctrl_type)
__get_unaligned_val; \
+       __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
+                        sizeof(__get_unaligned_val));                  \
+       __get_unaligned_val;                                            \
 })

in "__builtin_memcpy(&__get_unaligned_val, (void *)(ptr)" there is a
void* cast and I believe this is what sparse is now warning about - I
don't believe the warning was present at the time of the original
series.

I believe, although it is a distant memory, I tried making the cast a
"(const void*)" cast rather than a "void*" cast but this caused
different warnings/issues. My patch is going through a compiler
warning, sparse, etc. wac-a-mole and the comment notes the cast is
present to avoid warnings with ubsan (undefined behavior sanitizer).

I think there are 2 options:
1) ignore the new sparse warning as tech debt for later clean up,
2) modify the cast to be "const void*" instead of "void *" and play
more wac-a-mole.

My preference would be 1 as I have a suspicion I played 2 and thought
the non-const cast was best (hence it being in the patch) given other
issues.

Thanks,
Ian


> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   97             }
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   98     } else if=
 (event->param.conn.private_data_len >=3D
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23   99              =
  sizeof(struct rds_ib_connect_private)) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  100             m=
ajor =3D dp->ricp_v4.dp_protocol_major;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  101             m=
inor =3D dp->ricp_v4.dp_protocol_minor;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  102             c=
redit =3D dp->ricp_v4.dp_credit;
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  103             a=
ck_seq =3D get_unaligned(&dp->ricp_v4.dp_ack_seq);
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  104     }
> ec16227e14141e Andy Grover                  2009-02-24  105
> 02a6a2592e41d2 Andy Grover                  2009-07-17  106     /* make s=
ure it isn't empty data */
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  107     if (major=
) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  108             r=
ds_ib_set_protocol(conn, RDS_PROTOCOL(major, minor));
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  109             r=
ds_ib_set_flow_control(conn, be32_to_cpu(credit));
> 02a6a2592e41d2 Andy Grover                  2009-07-17  110     }
> ec16227e14141e Andy Grover                  2009-02-24  111
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  112     if (conn-=
>c_version < RDS_PROTOCOL_VERSION) {
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  113             i=
f (conn->c_version !=3D RDS_PROTOCOL_COMPAT_VERSION) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  114              =
       pr_notice("RDS/IB: Connection <%pI6c,%pI6c> version %u.%u no longer =
supported\n",
> ff3f19a2f608ee Santosh Shilimkar            2016-03-14  115              =
                 &conn->c_laddr, &conn->c_faddr,
> f147dd9ecabf23 Andy Grover                  2010-01-13  116              =
                 RDS_PROTOCOL_MAJOR(conn->c_version),
> f147dd9ecabf23 Andy Grover                  2010-01-13  117              =
                 RDS_PROTOCOL_MINOR(conn->c_version));
> f147dd9ecabf23 Andy Grover                  2010-01-13  118              =
       rds_conn_destroy(conn);
> f147dd9ecabf23 Andy Grover                  2010-01-13  119              =
       return;
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  120             }
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  121     }
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  122
> fd261ce6a30e01 Santosh Shilimkar            2018-10-13  123     pr_notice=
("RDS/IB: %s conn connected <%pI6c,%pI6c,%d> version %u.%u%s\n",
> 581d53c91cbf7b Santosh Shilimkar            2016-07-09  124              =
 ic->i_active_side ? "Active" : "Passive",
> fd261ce6a30e01 Santosh Shilimkar            2018-10-13  125              =
 &conn->c_laddr, &conn->c_faddr, conn->c_tos,
> ec16227e14141e Andy Grover                  2009-02-24  126              =
 RDS_PROTOCOL_MAJOR(conn->c_version),
> ec16227e14141e Andy Grover                  2009-02-24  127              =
 RDS_PROTOCOL_MINOR(conn->c_version),
> ec16227e14141e Andy Grover                  2009-02-24  128              =
 ic->i_flowctl ? ", flow control" : "");
> ec16227e14141e Andy Grover                  2009-02-24  129
> e0e6d062822529 Zhu Yanjun                   2019-08-23  130     /* receiv=
e sl from the peer */
> e0e6d062822529 Zhu Yanjun                   2019-08-23  131     ic->i_sl =
=3D ic->i_cm_id->route.path_rec->sl;
> e0e6d062822529 Zhu Yanjun                   2019-08-23  132
> cf657269d311d5 Santosh Shilimkar            2016-09-29  133     atomic_se=
t(&ic->i_cq_quiesce, 0);
> cf657269d311d5 Santosh Shilimkar            2016-09-29  134
> 581d53c91cbf7b Santosh Shilimkar            2016-07-09  135     /* Init r=
ings and fill recv. this needs to wait until protocol
> 581d53c91cbf7b Santosh Shilimkar            2016-07-09  136      * negoti=
ation is complete, since ring layout is different
> 581d53c91cbf7b Santosh Shilimkar            2016-07-09  137      * from 3=
.1 to 4.1.
> e11d912a7dd4df Andy Grover                  2009-07-17  138      */
> e11d912a7dd4df Andy Grover                  2009-07-17  139     rds_ib_se=
nd_init_ring(ic);
> e11d912a7dd4df Andy Grover                  2009-07-17  140     rds_ib_re=
cv_init_ring(ic);
> e11d912a7dd4df Andy Grover                  2009-07-17  141     /* Post r=
eceive buffers - as a side effect, this will update
> e11d912a7dd4df Andy Grover                  2009-07-17  142      * the po=
sted credit count. */
> 73ce4317bf9832 santosh.shilimkar@oracle.com 2015-08-22  143     rds_ib_re=
cv_refill(conn, 1, GFP_KERNEL);
> e11d912a7dd4df Andy Grover                  2009-07-17  144
> 3e0249f9c05cb7 Zach Brown                   2010-05-18  145     /* update=
 ib_device with this local ipaddr */
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  146     err =3D r=
ds_ib_update_ipaddr(ic->rds_ibdev, &conn->c_laddr);
> ec16227e14141e Andy Grover                  2009-02-24  147     if (err)
> 3e0249f9c05cb7 Zach Brown                   2010-05-18  148             p=
rintk(KERN_ERR "rds_ib_update_ipaddr failed (%d)\n",
> 3e0249f9c05cb7 Zach Brown                   2010-05-18  149              =
       err);
> ec16227e14141e Andy Grover                  2009-02-24  150
> ec16227e14141e Andy Grover                  2009-02-24  151     /* If the=
 peer gave us the last packet it saw, process this as if
> ec16227e14141e Andy Grover                  2009-02-24  152      * we had=
 received a regular ACK. */
> c0adf54a10903b shamir rabinovitch           2015-04-30  153     if (dp) {
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  154             i=
f (ack_seq)
> eee2fa6ab32251 Ka-Cheong Poon               2018-07-23  155              =
       rds_send_drop_acked(conn, be64_to_cpu(ack_seq),
> c0adf54a10903b shamir rabinovitch           2015-04-30  156              =
                           NULL);
> c0adf54a10903b shamir rabinovitch           2015-04-30  157     }
> ec16227e14141e Andy Grover                  2009-02-24  158
> cdc306a5c9cd36 Santosh Shilimkar            2018-10-13  159     conn->c_p=
roposed_version =3D conn->c_version;
> ec16227e14141e Andy Grover                  2009-02-24  160     rds_conne=
ct_complete(conn);
> ec16227e14141e Andy Grover                  2009-02-24  161  }
> ec16227e14141e Andy Grover                  2009-02-24  162
>
> :::::: The code at line 96 was first introduced by commit
> :::::: eee2fa6ab3225192d6d894c54a6fb02ac9efdff6 rds: Changing IP address =
internal representation to struct in6_addr
>
> :::::: TO: Ka-Cheong Poon <ka-cheong.poon@oracle.com>
> :::::: CC: David S. Miller <davem@davemloft.net>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
