Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6855AD53B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 23:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064B9C433D2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 23:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677799263;
	bh=qo3chCtWsWIeT1JZX58wKxnKplyeeJNR+C4FZcCN1Fc=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=Ebvu6U4R7DsawQUH6tZidVuEJ+j4yztiFo/oY8jFnkKyu66PKg8lwbKlsZ8N8d0xW
	 2poJmRSMojK4INpCj1cMuur+8a9NbhMHBfFSd+ANxwNoat5fTWtiCZ7pkBFCdI2X7r
	 pOKRXT3U+iuyepUgu6M6NpGxmL5A7UOz/WT/XCF8iEeA5Fx6S+YXCS23+2beqfU0Lj
	 wsqrWrjwW3aMy/w9z32EGap1lL+fu9kxUmc0YVNHMJZwiSgfZ9QdGEj1LDRkmH1GrN
	 xXoqIVD5tTzjsPPD25vNxxNGoIBRbB1UcmSlFQNteOgYvtdmVx1aJIxXXWjOpctABi
	 bVCcGgEE8fYTw==
Received: by mail-ot1-f46.google.com with SMTP id m25-20020a05683026d900b006941a2838caso537188otu.7
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Mar 2023 15:21:02 -0800 (PST)
X-Gm-Message-State: AO0yUKWqWCzMIlEgx62zXPUhxkK/hh+lGiKivKO3q4aYIgaaRLw86bAI
	RTIXq8fNNeESVSssbgsiMSDO2CP10TRIE9g431c=
X-Google-Smtp-Source: AK7set+A+V/Hg2MnN0pVwEVAJ3Oa4fXZmVfzfoGefFwf/d1DqRVdDGazAojE/+dsD2/ouS1PpNQ9yMEF+53Py7J6E6E=
X-Received: by 2002:a05:6830:4388:b0:68d:3fc4:a1e7 with SMTP id
 s8-20020a056830438800b0068d3fc4a1e7mr1586511otv.2.1677799262102; Thu, 02 Mar
 2023 15:21:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:67ca:0:b0:4c2:5d59:8c51 with HTTP; Thu, 2 Mar 2023
 15:21:01 -0800 (PST)
In-Reply-To: <202303030232.TF5A2Q2F-lkp@intel.com>
References: <202303030232.TF5A2Q2F-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 3 Mar 2023 08:21:01 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8oGsXhvoWOkB3qOZyheQrsnTi5yEyzjAZuu3KCyGO-Jg@mail.gmail.com>
Message-ID: <CAKYAXd8oGsXhvoWOkB3qOZyheQrsnTi5yEyzjAZuu3KCyGO-Jg@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/ksmbd/smb2pdu.c:4941:42:
 sparse: sparse: invalid assignment: |=
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

2023-03-03 3:56 GMT+09:00, kernel test robot <lkp@intel.com>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   41ab2e2f3e0f32379d61f3ff31966bdf37a2b420
> commit: 41ab2e2f3e0f32379d61f3ff31966bdf37a2b420 [2/2] ksmbd: set
> FILE_NAMED_STREAMS attribute in FS_ATTRIBUTE_INFORMATION
> config: loongarch-randconfig-s033-20230302
> (https://download.01.org/0day-ci/archive/20230303/202303030232.TF5A2Q2F-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce:
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         git remote add samba-ksmbd git://git.samba.org/ksmbd.git
>         git fetch --no-tags samba-ksmbd ksmbd-for-next-next
>         git checkout 41ab2e2f3e0f32379d61f3ff31966bdf37a2b420
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1
> CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch
> olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1
> CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch
> SHELL=/bin/bash drivers/net/ethernet/sfc/ fs/ksmbd/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link:
> https://lore.kernel.org/oe-kbuild-all/202303030232.TF5A2Q2F-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> fs/ksmbd/smb2pdu.c:4941:42: sparse: sparse: invalid assignment: |=
>>> fs/ksmbd/smb2pdu.c:4941:42: sparse:    left side has type restricted
>>> __le32
>>> fs/ksmbd/smb2pdu.c:4941:42: sparse:    right side has type int
>
> vim +4941 fs/ksmbd/smb2pdu.c
>
>   4881	
>   4882	static int smb2_get_info_filesystem(struct ksmbd_work *work,
>   4883					    struct smb2_query_info_req *req,
>   4884					    struct smb2_query_info_rsp *rsp)
>   4885	{
>   4886		struct ksmbd_session *sess = work->sess;
>   4887		struct ksmbd_conn *conn = work->conn;
>   4888		struct ksmbd_share_config *share = work->tcon->share_conf;
>   4889		int fsinfoclass = 0;
>   4890		struct kstatfs stfs;
>   4891		struct path path;
>   4892		int rc = 0, len;
>   4893		int fs_infoclass_size = 0;
>   4894	
>   4895		rc = kern_path(share->path, LOOKUP_NO_SYMLINKS, &path);
>   4896		if (rc) {
>   4897			pr_err("cannot create vfs path\n");
>   4898			return -EIO;
>   4899		}
>   4900	
>   4901		rc = vfs_statfs(&path, &stfs);
>   4902		if (rc) {
>   4903			pr_err("cannot do stat of path %s\n", share->path);
>   4904			path_put(&path);
>   4905			return -EIO;
>   4906		}
>   4907	
>   4908		fsinfoclass = req->FileInfoClass;
>   4909	
>   4910		switch (fsinfoclass) {
>   4911		case FS_DEVICE_INFORMATION:
>   4912		{
>   4913			struct filesystem_device_info *info;
>   4914	
>   4915			info = (struct filesystem_device_info *)rsp->Buffer;
>   4916	
>   4917			info->DeviceType = cpu_to_le32(stfs.f_type);
>   4918			info->DeviceCharacteristics = cpu_to_le32(0x00000020);
>   4919			rsp->OutputBufferLength = cpu_to_le32(8);
>   4920			inc_rfc1001_len(work->response_buf, 8);
>   4921			fs_infoclass_size = FS_DEVICE_INFORMATION_SIZE;
>   4922			break;
>   4923		}
>   4924		case FS_ATTRIBUTE_INFORMATION:
>   4925		{
>   4926			struct filesystem_attribute_info *info;
>   4927			size_t sz;
>   4928	
>   4929			info = (struct filesystem_attribute_info *)rsp->Buffer;
>   4930			info->Attributes = cpu_to_le32(FILE_SUPPORTS_OBJECT_IDS |
>   4931						       FILE_PERSISTENT_ACLS |
>   4932						       FILE_UNICODE_ON_DISK |
>   4933						       FILE_CASE_PRESERVED_NAMES |
>   4934						       FILE_CASE_SENSITIVE_SEARCH |
>   4935						       FILE_SUPPORTS_BLOCK_REFCOUNTING);
>   4936	
>   4937			info->Attributes |= cpu_to_le32(server_conf.share_fake_fscaps);
>   4938	
>   4939			if (test_share_config_flag(work->tcon->share_conf,
>   4940			    KSMBD_SHARE_FLAG_STREAMS))
>> 4941				info->Attributes |= FILE_NAMED_STREAMS;
Thanks for your report! I will fix it:)
