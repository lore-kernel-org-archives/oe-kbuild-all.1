Content-Type: multipart/mixed; boundary="===============6353126248532000081=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [cifs:for-next 32/32] fs/cifs/smb2ops.c:3055:26: warning: variable 'create_rsp' set but not used
Date: Sat, 24 Oct 2020 01:11:09 +0800
Message-ID: <202010240103.v7BZmVA0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6353126248532000081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   1bfcaa4b7f0b84d397f0080aec64c4c948fc84c0
commit: 1bfcaa4b7f0b84d397f0080aec64c4c948fc84c0 [32/32] smb3: remove unuse=
d variable
config: mips-randconfig-r034-20201022 (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add cifs git://git.samba.org/sfrench/cifs-2.6.git
        git fetch --no-tags cifs for-next
        git checkout 1bfcaa4b7f0b84d397f0080aec64c4c948fc84c0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/cifs/smb2ops.c: In function 'smb2_query_reparse_tag':
>> fs/cifs/smb2ops.c:3055:26: warning: variable 'create_rsp' set but not us=
ed [-Wunused-but-set-variable]
    3055 |  struct smb2_create_rsp *create_rsp;
         |                          ^~~~~~~~~~

vim +/create_rsp +3055 fs/cifs/smb2ops.c

b42bf88828cde6 Pavel Shilovsky 2013-08-14  3036  =

3d15f3db17ec6b Steve French    2020-10-22  3037  int
3d15f3db17ec6b Steve French    2020-10-22  3038  smb2_query_reparse_tag(con=
st unsigned int xid, struct cifs_tcon *tcon,
3d15f3db17ec6b Steve French    2020-10-22  3039  		   struct cifs_sb_info *=
cifs_sb, const char *full_path,
3d15f3db17ec6b Steve French    2020-10-22  3040  		   __u32 *tag)
3d15f3db17ec6b Steve French    2020-10-22  3041  {
3d15f3db17ec6b Steve French    2020-10-22  3042  	int rc;
3d15f3db17ec6b Steve French    2020-10-22  3043  	__le16 *utf16_path =3D NU=
LL;
3d15f3db17ec6b Steve French    2020-10-22  3044  	__u8 oplock =3D SMB2_OPLO=
CK_LEVEL_NONE;
3d15f3db17ec6b Steve French    2020-10-22  3045  	struct cifs_open_parms op=
arms;
3d15f3db17ec6b Steve French    2020-10-22  3046  	struct cifs_fid fid;
3d15f3db17ec6b Steve French    2020-10-22  3047  	struct TCP_Server_Info *s=
erver =3D cifs_pick_channel(tcon->ses);
3d15f3db17ec6b Steve French    2020-10-22  3048  	int flags =3D 0;
3d15f3db17ec6b Steve French    2020-10-22  3049  	struct smb_rqst rqst[3];
3d15f3db17ec6b Steve French    2020-10-22  3050  	int resp_buftype[3];
3d15f3db17ec6b Steve French    2020-10-22  3051  	struct kvec rsp_iov[3];
3d15f3db17ec6b Steve French    2020-10-22  3052  	struct kvec open_iov[SMB2=
_CREATE_IOV_SIZE];
3d15f3db17ec6b Steve French    2020-10-22  3053  	struct kvec io_iov[SMB2_I=
OCTL_IOV_SIZE];
3d15f3db17ec6b Steve French    2020-10-22  3054  	struct kvec close_iov[1];
3d15f3db17ec6b Steve French    2020-10-22 @3055  	struct smb2_create_rsp *c=
reate_rsp;
3d15f3db17ec6b Steve French    2020-10-22  3056  	struct smb2_ioctl_rsp *io=
ctl_rsp;
3d15f3db17ec6b Steve French    2020-10-22  3057  	struct reparse_data_buffe=
r *reparse_buf;
3d15f3db17ec6b Steve French    2020-10-22  3058  	u32 plen;
3d15f3db17ec6b Steve French    2020-10-22  3059  =

3d15f3db17ec6b Steve French    2020-10-22  3060  	cifs_dbg(FYI, "%s: path: =
%s\n", __func__, full_path);
3d15f3db17ec6b Steve French    2020-10-22  3061  =

3d15f3db17ec6b Steve French    2020-10-22  3062  	if (smb3_encryption_requi=
red(tcon))
3d15f3db17ec6b Steve French    2020-10-22  3063  		flags |=3D CIFS_TRANSFOR=
M_REQ;
3d15f3db17ec6b Steve French    2020-10-22  3064  =

3d15f3db17ec6b Steve French    2020-10-22  3065  	memset(rqst, 0, sizeof(rq=
st));
3d15f3db17ec6b Steve French    2020-10-22  3066  	resp_buftype[0] =3D resp_=
buftype[1] =3D resp_buftype[2] =3D CIFS_NO_BUFFER;
3d15f3db17ec6b Steve French    2020-10-22  3067  	memset(rsp_iov, 0, sizeof=
(rsp_iov));
3d15f3db17ec6b Steve French    2020-10-22  3068  =

3d15f3db17ec6b Steve French    2020-10-22  3069  	utf16_path =3D cifs_conve=
rt_path_to_utf16(full_path, cifs_sb);
3d15f3db17ec6b Steve French    2020-10-22  3070  	if (!utf16_path)
3d15f3db17ec6b Steve French    2020-10-22  3071  		return -ENOMEM;
3d15f3db17ec6b Steve French    2020-10-22  3072  =

3d15f3db17ec6b Steve French    2020-10-22  3073  	/*
3d15f3db17ec6b Steve French    2020-10-22  3074  	 * setup smb2open - TODO =
add optimization to call cifs_get_readable_path
3d15f3db17ec6b Steve French    2020-10-22  3075  	 * to see if there is a h=
andle already open that we can use
3d15f3db17ec6b Steve French    2020-10-22  3076  	 */
3d15f3db17ec6b Steve French    2020-10-22  3077  	memset(&open_iov, 0, size=
of(open_iov));
3d15f3db17ec6b Steve French    2020-10-22  3078  	rqst[0].rq_iov =3D open_i=
ov;
3d15f3db17ec6b Steve French    2020-10-22  3079  	rqst[0].rq_nvec =3D SMB2_=
CREATE_IOV_SIZE;
3d15f3db17ec6b Steve French    2020-10-22  3080  =

3d15f3db17ec6b Steve French    2020-10-22  3081  	memset(&oparms, 0, sizeof=
(oparms));
3d15f3db17ec6b Steve French    2020-10-22  3082  	oparms.tcon =3D tcon;
3d15f3db17ec6b Steve French    2020-10-22  3083  	oparms.desired_access =3D=
 FILE_READ_ATTRIBUTES;
3d15f3db17ec6b Steve French    2020-10-22  3084  	oparms.disposition =3D FI=
LE_OPEN;
3d15f3db17ec6b Steve French    2020-10-22  3085  	oparms.create_options =3D=
 cifs_create_options(cifs_sb, OPEN_REPARSE_POINT);
3d15f3db17ec6b Steve French    2020-10-22  3086  	oparms.fid =3D &fid;
3d15f3db17ec6b Steve French    2020-10-22  3087  	oparms.reconnect =3D fals=
e;
3d15f3db17ec6b Steve French    2020-10-22  3088  =

3d15f3db17ec6b Steve French    2020-10-22  3089  	rc =3D SMB2_open_init(tco=
n, server,
3d15f3db17ec6b Steve French    2020-10-22  3090  			    &rqst[0], &oplock, =
&oparms, utf16_path);
3d15f3db17ec6b Steve French    2020-10-22  3091  	if (rc)
3d15f3db17ec6b Steve French    2020-10-22  3092  		goto query_rp_exit;
3d15f3db17ec6b Steve French    2020-10-22  3093  	smb2_set_next_command(tco=
n, &rqst[0]);
3d15f3db17ec6b Steve French    2020-10-22  3094  =

3d15f3db17ec6b Steve French    2020-10-22  3095  =

3d15f3db17ec6b Steve French    2020-10-22  3096  	/* IOCTL */
3d15f3db17ec6b Steve French    2020-10-22  3097  	memset(&io_iov, 0, sizeof=
(io_iov));
3d15f3db17ec6b Steve French    2020-10-22  3098  	rqst[1].rq_iov =3D io_iov;
3d15f3db17ec6b Steve French    2020-10-22  3099  	rqst[1].rq_nvec =3D SMB2_=
IOCTL_IOV_SIZE;
3d15f3db17ec6b Steve French    2020-10-22  3100  =

3d15f3db17ec6b Steve French    2020-10-22  3101  	rc =3D SMB2_ioctl_init(tc=
on, server,
3d15f3db17ec6b Steve French    2020-10-22  3102  			     &rqst[1], fid.pers=
istent_fid,
3d15f3db17ec6b Steve French    2020-10-22  3103  			     fid.volatile_fid, =
FSCTL_GET_REPARSE_POINT,
3d15f3db17ec6b Steve French    2020-10-22  3104  			     true /* is_fctl */=
, NULL, 0,
3d15f3db17ec6b Steve French    2020-10-22  3105  			     CIFSMaxBufSize -
3d15f3db17ec6b Steve French    2020-10-22  3106  			     MAX_SMB2_CREATE_RE=
SPONSE_SIZE -
3d15f3db17ec6b Steve French    2020-10-22  3107  			     MAX_SMB2_CLOSE_RES=
PONSE_SIZE);
3d15f3db17ec6b Steve French    2020-10-22  3108  	if (rc)
3d15f3db17ec6b Steve French    2020-10-22  3109  		goto query_rp_exit;
3d15f3db17ec6b Steve French    2020-10-22  3110  =

3d15f3db17ec6b Steve French    2020-10-22  3111  	smb2_set_next_command(tco=
n, &rqst[1]);
3d15f3db17ec6b Steve French    2020-10-22  3112  	smb2_set_related(&rqst[1]=
);
3d15f3db17ec6b Steve French    2020-10-22  3113  =

3d15f3db17ec6b Steve French    2020-10-22  3114  =

3d15f3db17ec6b Steve French    2020-10-22  3115  	/* Close */
3d15f3db17ec6b Steve French    2020-10-22  3116  	memset(&close_iov, 0, siz=
eof(close_iov));
3d15f3db17ec6b Steve French    2020-10-22  3117  	rqst[2].rq_iov =3D close_=
iov;
3d15f3db17ec6b Steve French    2020-10-22  3118  	rqst[2].rq_nvec =3D 1;
3d15f3db17ec6b Steve French    2020-10-22  3119  =

3d15f3db17ec6b Steve French    2020-10-22  3120  	rc =3D SMB2_close_init(tc=
on, server,
3d15f3db17ec6b Steve French    2020-10-22  3121  			     &rqst[2], COMPOUND=
_FID, COMPOUND_FID, false);
3d15f3db17ec6b Steve French    2020-10-22  3122  	if (rc)
3d15f3db17ec6b Steve French    2020-10-22  3123  		goto query_rp_exit;
3d15f3db17ec6b Steve French    2020-10-22  3124  =

3d15f3db17ec6b Steve French    2020-10-22  3125  	smb2_set_related(&rqst[2]=
);
3d15f3db17ec6b Steve French    2020-10-22  3126  =

3d15f3db17ec6b Steve French    2020-10-22  3127  	rc =3D compound_send_recv=
(xid, tcon->ses, server,
3d15f3db17ec6b Steve French    2020-10-22  3128  				flags, 3, rqst,
3d15f3db17ec6b Steve French    2020-10-22  3129  				resp_buftype, rsp_iov);
3d15f3db17ec6b Steve French    2020-10-22  3130  =

3d15f3db17ec6b Steve French    2020-10-22  3131  	create_rsp =3D rsp_iov[0]=
.iov_base;
3d15f3db17ec6b Steve French    2020-10-22  3132  	ioctl_rsp =3D rsp_iov[1].=
iov_base;
3d15f3db17ec6b Steve French    2020-10-22  3133  =

3d15f3db17ec6b Steve French    2020-10-22  3134  	/*
3d15f3db17ec6b Steve French    2020-10-22  3135  	 * Open was successful an=
d we got an ioctl response.
3d15f3db17ec6b Steve French    2020-10-22  3136  	 */
3d15f3db17ec6b Steve French    2020-10-22  3137  	if (rc =3D=3D 0) {
3d15f3db17ec6b Steve French    2020-10-22  3138  		/* See MS-FSCC 2.3.23 */
3d15f3db17ec6b Steve French    2020-10-22  3139  =

3d15f3db17ec6b Steve French    2020-10-22  3140  		reparse_buf =3D (struct =
reparse_data_buffer *)
3d15f3db17ec6b Steve French    2020-10-22  3141  			((char *)ioctl_rsp +
3d15f3db17ec6b Steve French    2020-10-22  3142  			 le32_to_cpu(ioctl_rsp-=
>OutputOffset));
3d15f3db17ec6b Steve French    2020-10-22  3143  		plen =3D le32_to_cpu(ioc=
tl_rsp->OutputCount);
3d15f3db17ec6b Steve French    2020-10-22  3144  =

3d15f3db17ec6b Steve French    2020-10-22  3145  		if (plen + le32_to_cpu(i=
octl_rsp->OutputOffset) >
3d15f3db17ec6b Steve French    2020-10-22  3146  		    rsp_iov[1].iov_len) {
3d15f3db17ec6b Steve French    2020-10-22  3147  			cifs_tcon_dbg(FYI, "srv=
 returned invalid ioctl len: %d\n",
3d15f3db17ec6b Steve French    2020-10-22  3148  				 plen);
3d15f3db17ec6b Steve French    2020-10-22  3149  			rc =3D -EIO;
3d15f3db17ec6b Steve French    2020-10-22  3150  			goto query_rp_exit;
3d15f3db17ec6b Steve French    2020-10-22  3151  		}
3d15f3db17ec6b Steve French    2020-10-22  3152  		*tag =3D le32_to_cpu(rep=
arse_buf->ReparseTag);
3d15f3db17ec6b Steve French    2020-10-22  3153  	}
3d15f3db17ec6b Steve French    2020-10-22  3154  =

3d15f3db17ec6b Steve French    2020-10-22  3155   query_rp_exit:
3d15f3db17ec6b Steve French    2020-10-22  3156  	kfree(utf16_path);
3d15f3db17ec6b Steve French    2020-10-22  3157  	SMB2_open_free(&rqst[0]);
3d15f3db17ec6b Steve French    2020-10-22  3158  	SMB2_ioctl_free(&rqst[1]);
3d15f3db17ec6b Steve French    2020-10-22  3159  	SMB2_close_free(&rqst[2]);
3d15f3db17ec6b Steve French    2020-10-22  3160  	free_rsp_buf(resp_buftype=
[0], rsp_iov[0].iov_base);
3d15f3db17ec6b Steve French    2020-10-22  3161  	free_rsp_buf(resp_buftype=
[1], rsp_iov[1].iov_base);
3d15f3db17ec6b Steve French    2020-10-22  3162  	free_rsp_buf(resp_buftype=
[2], rsp_iov[2].iov_base);
3d15f3db17ec6b Steve French    2020-10-22  3163  	return rc;
3d15f3db17ec6b Steve French    2020-10-22  3164  }
3d15f3db17ec6b Steve French    2020-10-22  3165  =


:::::: The code at line 3055 was first introduced by commit
:::::: 3d15f3db17ec6bd0bb8c73b2e38bd4e0e8ba0066 smb3: add support for stat =
of WSL reparse points for special file types

:::::: TO: Steve French <stfrench@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6353126248532000081==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6353126248532000081==--

