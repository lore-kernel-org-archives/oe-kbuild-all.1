Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BFCCA55
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 18:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB333C433C7;
	Fri,  4 Aug 2023 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691174523;
	bh=pUPuOSzewORwqV7IeCfIBTPdc7Lzixhc7Cz/6O/40IU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VJAdYI/FicmNuYS7x6sWiixt1QvXtPjOW2CioSUVFRCZT8gzOgvT4j18gzw+Xgljb
	 /etMG+VgP80R5BjOHMjXm9sPGkgQr5fwQNog4dan3E28kxqH/7TirQlZbChYusgWM7
	 AiC5m4q276BNgTiFRXUbd2NFxdvaebKwLNMZBwI87JkYRWmPvu/xI/qxolrJ7OO0YT
	 KtdbpIyUB1B5xnQg3Mu20mPetczq7PBYfE+BzXQ79/B7YuzYfMCRfqroaFbx5y7ZiC
	 W5S8s16ODIXtRi1Ozc1FxvSXgArh9nyC5UT3k83woXhuv0Tupo6Mg9s+GrXN1uU7jV
	 naTPnpPYIfUWw==
Message-ID: <25449d00b11d5319b3e5405e89f287a96e95dc26.camel@kernel.org>
Subject: Re: [PATCH v7] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Date: Fri, 04 Aug 2023 14:42:01 -0400
In-Reply-To: <202308050110.6Zheq1P5-lkp@intel.com>
References: <20230804-master-v7-1-5d4e48407298@kernel.org>
	 <202308050110.6Zheq1P5-lkp@intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2023-08-05 at 01:43 +0800, kernel test robot wrote:
> Hi Jeff,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-se=
curity-Fix-automount-superblock-LSM-init-problem-preventing-NFS-sb-sharing/=
20230805-001234
> base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> patch link:    https://lore.kernel.org/r/20230804-master-v7-1-5d4e4840729=
8%40kernel.org
> patch subject: [PATCH v7] vfs, security: Fix automount superblock LSM ini=
t problem, preventing NFS sb sharing
> config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/2=
0230805/202308050110.6Zheq1P5-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050110=
.6Zheq1P5-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202308050110.6Zheq1P5-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    security/smack/smack_lsm.c: In function 'smack_fs_context_init':
> > > security/smack/smack_lsm.c:631:66: warning: suggest braces around emp=
ty body in an 'if' statement [-Wempty-body]
>      631 |         if (!reference || fc->purpose !=3D FS_CONTEXT_FOR_SUBM=
OUNT);
>          |                                                               =
   ^
> > > security/smack/smack_lsm.c:631:9: warning: this 'if' clause does not =
guard... [-Wmisleading-indentation]
>      631 |         if (!reference || fc->purpose !=3D FS_CONTEXT_FOR_SUBM=
OUNT);
>          |         ^~
>    security/smack/smack_lsm.c:632:17: note: ...this statement, but the la=
tter is misleadingly indented as if it were guarded by the 'if'
>      632 |                 return 0;
>          |                 ^~~~~~
>=20
>=20
> vim +/if +631 security/smack/smack_lsm.c
>=20
>    616=09
>    617	/**
>    618	 * smack_fs_context_init - Initialise security data for a filesyst=
em context
>    619	 * @fc: The filesystem context.
>    620	 * @reference: Reference dentry (automount/reconfigure) or NULL
>    621	 *
>    622	 * Returns 0 on success or -ENOMEM on error.
>    623	 */
>    624	static int smack_fs_context_init(struct fs_context *fc,
>    625					 struct dentry *reference)
>    626	{
>    627		struct superblock_smack *sbsp;
>    628		struct smack_mnt_opts *ctx;
>    629		struct inode_smack *isp;
>    630=09
>  > 631		if (!reference || fc->purpose !=3D FS_CONTEXT_FOR_SUBMOUNT);

Ouch! Bad semicolon on the end. Fixed in my tree.

>    632			return 0;
>    633=09
>    634		ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);
>    635		if (!ctx)
>    636			return -ENOMEM;
>    637		fc->security =3D ctx;
>    638=09
>    639		sbsp =3D smack_superblock(reference->d_sb);
>    640		isp =3D smack_inode(reference->d_sb->s_root->d_inode);
>    641=09
>    642		if (sbsp->smk_default) {
>    643			ctx->fsdefault =3D kstrdup(sbsp->smk_default->smk_known, GFP_KER=
NEL);
>    644			if (!ctx->fsdefault)
>    645				return -ENOMEM;
>    646		}
>    647=09
>    648		if (sbsp->smk_floor) {
>    649			ctx->fsfloor =3D kstrdup(sbsp->smk_floor->smk_known, GFP_KERNEL)=
;
>    650			if (!ctx->fsfloor)
>    651				return -ENOMEM;
>    652		}
>    653=09
>    654		if (sbsp->smk_hat) {
>    655			ctx->fshat =3D kstrdup(sbsp->smk_hat->smk_known, GFP_KERNEL);
>    656			if (!ctx->fshat)
>    657				return -ENOMEM;
>    658		}
>    659=09
>    660		if (isp->smk_flags & SMK_INODE_TRANSMUTE) {
>    661			if (sbsp->smk_root) {
>    662				ctx->fstransmute =3D kstrdup(sbsp->smk_root->smk_known, GFP_KER=
NEL);
>    663				if (!ctx->fstransmute)
>    664					return -ENOMEM;
>    665			}
>    666		}
>    667		return 0;
>    668	}
>    669=09
>=20

--=20
Jeff Layton <jlayton@kernel.org>
