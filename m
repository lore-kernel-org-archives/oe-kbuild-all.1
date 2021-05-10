Content-Type: multipart/mixed; boundary="===============5827999230380147398=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not used
Date: Tue, 11 May 2021 02:27:59 +0800
Message-ID: <202105110252.nVQyXZxV-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5827999230380147398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jordan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6efb943b8616ec53a5e444193dccf1af9ad627b5
commit: 650b55b707fdfa764e9f2b81314d3eb4216fb962 powerpc: Add prefixed inst=
ructions to instruction data type
date:   12 months ago
config: powerpc-mpc866_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D650b55b707fdfa764e9f2b81314d3eb4216fb962
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 650b55b707fdfa764e9f2b81314d3eb4216fb962
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not u=
sed [-Werror=3Dunused-but-set-variable]
    1172 |  unsigned int word, suffix;
         |                     ^~~~~~
   arch/powerpc/lib/sstep.c:1168:31: error: variable 'rc' set but not used =
[-Werror=3Dunused-but-set-variable]
    1168 |  unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                               ^~
   cc1: all warnings being treated as errors


vim +/suffix +1172 arch/powerpc/lib/sstep.c

  1153	=

  1154	/*
  1155	 * Decode an instruction, and return information about it in *op
  1156	 * without changing *regs.
  1157	 * Integer arithmetic and logical instructions, branches, and barrier
  1158	 * instructions can be emulated just using the information in *op.
  1159	 *
  1160	 * Return value is 1 if the instruction can be emulated just by
  1161	 * updating *regs with the information in *op, -1 if we need the
  1162	 * GPRs but *regs doesn't contain the full register set, or 0
  1163	 * otherwise.
  1164	 */
  1165	int analyse_instr(struct instruction_op *op, const struct pt_regs *r=
egs,
  1166			  struct ppc_inst instr)
  1167	{
  1168		unsigned int opcode, ra, rb, rc, rd, spr, u;
  1169		unsigned long int imm;
  1170		unsigned long int val, val2;
  1171		unsigned int mb, me, sh;
> 1172		unsigned int word, suffix;
  1173		long ival;
  1174	=

  1175		word =3D ppc_inst_val(instr);
  1176		suffix =3D ppc_inst_suffix(instr);
  1177	=

  1178		op->type =3D COMPUTE;
  1179	=

  1180		opcode =3D ppc_inst_primary_opcode(instr);
  1181		switch (opcode) {
  1182		case 16:	/* bc */
  1183			op->type =3D BRANCH;
  1184			imm =3D (signed short)(word & 0xfffc);
  1185			if ((word & 2) =3D=3D 0)
  1186				imm +=3D regs->nip;
  1187			op->val =3D truncate_if_32bit(regs->msr, imm);
  1188			if (word & 1)
  1189				op->type |=3D SETLK;
  1190			if (branch_taken(word, regs, op))
  1191				op->type |=3D BRTAKEN;
  1192			return 1;
  1193	#ifdef CONFIG_PPC64
  1194		case 17:	/* sc */
  1195			if ((word & 0xfe2) =3D=3D 2)
  1196				op->type =3D SYSCALL;
  1197			else
  1198				op->type =3D UNKNOWN;
  1199			return 0;
  1200	#endif
  1201		case 18:	/* b */
  1202			op->type =3D BRANCH | BRTAKEN;
  1203			imm =3D word & 0x03fffffc;
  1204			if (imm & 0x02000000)
  1205				imm -=3D 0x04000000;
  1206			if ((word & 2) =3D=3D 0)
  1207				imm +=3D regs->nip;
  1208			op->val =3D truncate_if_32bit(regs->msr, imm);
  1209			if (word & 1)
  1210				op->type |=3D SETLK;
  1211			return 1;
  1212		case 19:
  1213			switch ((word >> 1) & 0x3ff) {
  1214			case 0:		/* mcrf */
  1215				op->type =3D COMPUTE + SETCC;
  1216				rd =3D 7 - ((word >> 23) & 0x7);
  1217				ra =3D 7 - ((word >> 18) & 0x7);
  1218				rd *=3D 4;
  1219				ra *=3D 4;
  1220				val =3D (regs->ccr >> ra) & 0xf;
  1221				op->ccval =3D (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1222				return 1;
  1223	=

  1224			case 16:	/* bclr */
  1225			case 528:	/* bcctr */
  1226				op->type =3D BRANCH;
  1227				imm =3D (word & 0x400)? regs->ctr: regs->link;
  1228				op->val =3D truncate_if_32bit(regs->msr, imm);
  1229				if (word & 1)
  1230					op->type |=3D SETLK;
  1231				if (branch_taken(word, regs, op))
  1232					op->type |=3D BRTAKEN;
  1233				return 1;
  1234	=

  1235			case 18:	/* rfid, scary */
  1236				if (regs->msr & MSR_PR)
  1237					goto priv;
  1238				op->type =3D RFI;
  1239				return 0;
  1240	=

  1241			case 150:	/* isync */
  1242				op->type =3D BARRIER | BARRIER_ISYNC;
  1243				return 1;
  1244	=

  1245			case 33:	/* crnor */
  1246			case 129:	/* crandc */
  1247			case 193:	/* crxor */
  1248			case 225:	/* crnand */
  1249			case 257:	/* crand */
  1250			case 289:	/* creqv */
  1251			case 417:	/* crorc */
  1252			case 449:	/* cror */
  1253				op->type =3D COMPUTE + SETCC;
  1254				ra =3D (word >> 16) & 0x1f;
  1255				rb =3D (word >> 11) & 0x1f;
  1256				rd =3D (word >> 21) & 0x1f;
  1257				ra =3D (regs->ccr >> (31 - ra)) & 1;
  1258				rb =3D (regs->ccr >> (31 - rb)) & 1;
  1259				val =3D (word >> (6 + ra * 2 + rb)) & 1;
  1260				op->ccval =3D (regs->ccr & ~(1UL << (31 - rd))) |
  1261					(val << (31 - rd));
  1262				return 1;
  1263			}
  1264			break;
  1265		case 31:
  1266			switch ((word >> 1) & 0x3ff) {
  1267			case 598:	/* sync */
  1268				op->type =3D BARRIER + BARRIER_SYNC;
  1269	#ifdef __powerpc64__
  1270				switch ((word >> 21) & 3) {
  1271				case 1:		/* lwsync */
  1272					op->type =3D BARRIER + BARRIER_LWSYNC;
  1273					break;
  1274				case 2:		/* ptesync */
  1275					op->type =3D BARRIER + BARRIER_PTESYNC;
  1276					break;
  1277				}
  1278	#endif
  1279				return 1;
  1280	=

  1281			case 854:	/* eieio */
  1282				op->type =3D BARRIER + BARRIER_EIEIO;
  1283				return 1;
  1284			}
  1285			break;
  1286		}
  1287	=

  1288		/* Following cases refer to regs->gpr[], so we need all regs */
  1289		if (!FULL_REGS(regs))
  1290			return -1;
  1291	=

  1292		rd =3D (word >> 21) & 0x1f;
  1293		ra =3D (word >> 16) & 0x1f;
  1294		rb =3D (word >> 11) & 0x1f;
  1295		rc =3D (word >> 6) & 0x1f;
  1296	=

  1297		switch (opcode) {
  1298	#ifdef __powerpc64__
  1299		case 2:		/* tdi */
  1300			if (rd & trap_compare(regs->gpr[ra], (short) word))
  1301				goto trap;
  1302			return 1;
  1303	#endif
  1304		case 3:		/* twi */
  1305			if (rd & trap_compare((int)regs->gpr[ra], (short) word))
  1306				goto trap;
  1307			return 1;
  1308	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5827999230380147398==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5827999230380147398==--

